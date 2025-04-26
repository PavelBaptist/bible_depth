part of 'fragment_bloc.dart';

@immutable
sealed class FragmentEvent extends Equatable {}

final class FragmentInitEvent extends FragmentEvent {
  @override
  List<Object?> get props => [];
}

final class FragmentloadEvent extends FragmentEvent {
  final List<Fragment> fragments;

  FragmentloadEvent({required this.fragments});

  @override
  List<Object?> get props => [fragments];
}
