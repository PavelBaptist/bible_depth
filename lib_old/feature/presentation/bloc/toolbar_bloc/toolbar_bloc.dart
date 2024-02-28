import 'package:bible_depth/feature/domain/entities/word_entity.dart';
import 'package:flutter/material.dart';

import 'toolbar_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toolbar_event.dart';

class ToolbarBloc extends Bloc<ToolbarEvent, ToolbarState> {
  ToolbarBloc() : super(ToolbarLoadedState()) {
    on<ToolbarInitEvent>(_onInit);
    on<ToolbarSelectToolEvent>(_onSelectTool);
  }

  _onInit(ToolbarInitEvent event, Emitter<ToolbarState> emit) async {
    emit(ToolbarLoadedState());
  }

  _onSelectTool(
      ToolbarSelectToolEvent event, Emitter<ToolbarState> emit) async {
    emit(ToolbarSelectedToolState(currentTool: event.currentTool));
  }
}
