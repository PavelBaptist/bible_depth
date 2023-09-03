import 'package:bible_depth/feature/domain/entities/word_entity.dart';
import 'package:equatable/equatable.dart';

abstract class WordsState extends Equatable {
  const WordsState();

  @override
  List<Object> get props => [];
}

class WordsLoadingState extends WordsState {}

class WordsLoadedState extends WordsState {
  List<WordEntity> wordEntityList;
  WordsLoadedState(this.wordEntityList);
}
