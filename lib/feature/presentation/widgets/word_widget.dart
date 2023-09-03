import 'package:bible_depth/feature/domain/entities/word_entity.dart';
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
        WordsBloc bloc = BlocProvider.of<WordsBloc>(context);
        bloc.add(WordsChangeWordEvent(wordEntity));
      },
      child: Text(wordEntity.value),
    );
  }
}
