import 'package:bible_depth/feature/domain/entities/fragment_entity.dart';
import 'package:equatable/equatable.dart';

abstract class FragmentDetailState extends Equatable {
  const FragmentDetailState();

  @override
  List<Object> get props => [];
}

class FragmentDetailLoading extends FragmentDetailState {}

class FragmentDetailLoaded extends FragmentDetailState {
  final FragmentEntity fragmentEntity;

  const FragmentDetailLoaded({required this.fragmentEntity});

  @override
  List<Object> get props => [fragmentEntity];
}
