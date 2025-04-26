part of 'fragment_bloc.dart';

@immutable
sealed class FragmentState extends Equatable {}

final class FragmentLoading extends FragmentState {
  @override
  List<Object?> get props => [];
}

final class FragmentLoaded extends FragmentState {
  final List<Fragment> fragments;

  FragmentLoaded({required this.fragments});

  @override
  List<Object?> get props => [fragments];
}
