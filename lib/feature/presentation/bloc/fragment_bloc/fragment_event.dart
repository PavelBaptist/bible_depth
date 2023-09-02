part of 'fragment_bloc.dart';

abstract class FragmentEvent extends Equatable {
  const FragmentEvent();

  @override
  List<Object?> get props => [];
}

class FragmentByIdEvent extends FragmentEvent {
  final int id;

  const FragmentByIdEvent(this.id);
}
