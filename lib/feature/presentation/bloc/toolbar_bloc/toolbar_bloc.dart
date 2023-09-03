import 'package:bible_depth/feature/domain/entities/word_entity.dart';

import 'toolbar_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toolbar_event.dart';

class ToolbarBloc extends Bloc<ToolbarEvent, ToolbarState> {
  ToolbarBloc() : super(ToolbarLoadedState()) {
    on<ToolbarInitEvent>(_onInit);
  }

  _onInit(ToolbarInitEvent event, Emitter<ToolbarState> emit) async {
    emit(ToolbarLoadedState());
  }
}
