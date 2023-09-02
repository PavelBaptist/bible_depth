import 'package:bible_depth/feature/domain/usecases/get_fragment_by_id.dart';

import 'fragment_detail_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fragment_detail_event.dart';

class BibleDepthBloc extends Bloc<FragmentDetailEvent, FragmentDetailState> {
  final GetFragmentById getFragmentById;

  BibleDepthBloc({required this.getFragmentById})
      : super(FragmentDetailLoading()) {
    on<FragmentDetailById>(_onById);
  }

  _onById(FragmentDetailById event, Emitter<FragmentDetailState> emit) async {
    emit(FragmentDetailLoading());

    final fragment = await getFragmentById(GetFragmentByIdParams(id: event.id));

    emit(FragmentDetailLoaded(fragmentEntity: fragment));
  }
}
