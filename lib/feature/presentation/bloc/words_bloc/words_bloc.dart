import 'package:bible_depth/feature/domain/entities/word_entity.dart';
import 'package:flutter/material.dart';

import 'words_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'words_event.dart';

class WordsBloc extends Bloc<WrodsEvent, WordsState> {
  WordsBloc() : super(WordsLoadingState()) {
    on<WordsInitEvent>(_onInit);
    on<WordsLoadingEvent>(_onLoading);
    on<WordsChangeWordEvent>(_onChangeWord);
  }

  _onInit(WordsInitEvent event, Emitter<WordsState> emit) async {
    emit(WordsLoadingState());
  }

  _onLoading(WordsLoadingEvent event, Emitter<WordsState> emit) async {
    emit(WordsLoadingState());

    emit(WordsLoadedState(event.wordEntityList));
  }

  _onChangeWord(WordsChangeWordEvent event, Emitter<WordsState> emit) async {
    emit(WordsLoadingState());
    event.currentWordEntity.color = event.tool;
    emit(WordsLoadedState(event.wordEntityList));
  }
}
