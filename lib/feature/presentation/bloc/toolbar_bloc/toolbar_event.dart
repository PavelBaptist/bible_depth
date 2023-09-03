part of 'toolbar_bloc.dart';

abstract class ToolbarEvent extends Equatable {
  const ToolbarEvent();

  @override
  List<Object?> get props => [];
}

class ToolbarInitEvent extends ToolbarEvent {}
