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
  WordEntity wordEntity;
  WordsChangeWordEvent(this.wordEntity);
}
