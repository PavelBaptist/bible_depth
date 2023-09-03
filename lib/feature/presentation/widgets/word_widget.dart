import 'package:bible_depth/feature/domain/entities/word_entity.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_state.dart';
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
        FragmentBloc fragmentBloc = BlocProvider.of<FragmentBloc>(context);
        FragmentState fragmentState = fragmentBloc.state;
        if (fragmentState is FragmentLoadedState) {
          WordsBloc wordsBloc = BlocProvider.of<WordsBloc>(context);
          wordsBloc.add(WordsChangeWordEvent(
            currentWordEntity: wordEntity,
            wordEntityList: fragmentState.fragmentEntity.text,
          ));
        }
      },
      child: Text(wordEntity.value),
    );
  }
}
