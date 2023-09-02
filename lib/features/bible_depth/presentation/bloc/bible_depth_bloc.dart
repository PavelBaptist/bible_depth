import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bible_depth_event.dart';
part 'bible_depth_state.dart';

class BibleDepthBloc extends Bloc<BibleDepthEvent, BibleDepthState> {
  BibleDepthBloc() : super(BibleDepthInitial()) {
    on<BibleDepthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
