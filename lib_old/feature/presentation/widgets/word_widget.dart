import 'package:bible_depth/feature/domain/entities/word_entity.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_state.dart';
import 'package:bible_depth/feature/presentation/bloc/toolbar_bloc/toolbar_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/toolbar_bloc/toolbar_state.dart';
import 'package:bible_depth/feature/presentation/bloc/words_bloc/words_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordWidget extends StatelessWidget {
  WordEntity wordEntity;
  WordWidget({super.key, required this.wordEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FragmentState fragmentState =
            BlocProvider.of<FragmentBloc>(context).state;
        ToolbarState toolbarState = BlocProvider.of<ToolbarBloc>(context).state;
        if (fragmentState is FragmentLoadedState &&
            toolbarState is ToolbarSelectedToolState &&
            toolbarState.currentTool != null) {
          WordsBloc wordsBloc = BlocProvider.of<WordsBloc>(context);
          wordsBloc.add(WordsChangeWordEvent(
            currentWordEntity: wordEntity,
            wordEntityList: fragmentState.fragmentEntity.text,
            tool: toolbarState.currentTool!,
          ));
        }
      },
      child: Text(
        wordEntity.value,
        style: TextStyle(backgroundColor: wordEntity.color),
      ),
    );
  }
}
