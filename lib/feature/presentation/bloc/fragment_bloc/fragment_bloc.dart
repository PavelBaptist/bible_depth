import 'package:bible_depth/feature/domain/usecases/get_fragment_by_id.dart';

import 'fragment_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fragment_event.dart';

class FragmentBloc extends Bloc<FragmentEvent, FragmentState> {
  final GetFragmentById getFragmentById;

  FragmentBloc({required this.getFragmentById})
      : super(FragmentLoadingState()) {
    on<FragmentByIdEvent>(_onById);
  }

  _onById(FragmentByIdEvent event, Emitter<FragmentState> emit) async {
    emit(FragmentLoadingState());

    final fragment = await getFragmentById(GetFragmentByIdParams(id: event.id));

    emit(FragmentLoadedState(fragmentEntity: fragment));
  }
}
