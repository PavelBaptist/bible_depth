part of 'fragment_detail_bloc.dart';

abstract class FragmentDetailEvent extends Equatable {
  const FragmentDetailEvent();

  @override
  List<Object?> get props => [];
}

class FragmentDetailById extends FragmentDetailEvent {
  final int id;

  const FragmentDetailById(this.id);
}
