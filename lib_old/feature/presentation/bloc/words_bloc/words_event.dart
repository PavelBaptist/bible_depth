part of 'words_bloc.dart';

abstract class WrodsEvent extends Equatable {
  const WrodsEvent();

  @override
  List<Object?> get props => [];
}

class WordsInitEvent extends WrodsEvent {}

class WordsLoadingEvent extends WrodsEvent {
  List<WordEntity> wordEntityList;

  WordsLoadingEvent(this.wordEntityList);
}

class WordsChangeWordEvent extends WrodsEvent {
  List<WordEntity> wordEntityList;
  WordEntity currentWordEntity;
  Color tool;
  WordsChangeWordEvent(
      {required this.wordEntityList,
      required this.currentWordEntity,
      required this.tool});
}
