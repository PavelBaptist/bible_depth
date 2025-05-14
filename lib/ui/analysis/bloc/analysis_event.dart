part of 'analysis_bloc.dart';

@immutable
sealed class AnalysisEvent extends Equatable {}

final class AnalysisInitEvent extends AnalysisEvent {
  @override
  List<Object?> get props => [];
}

final class AnalysisloadEvent extends AnalysisEvent {
  AnalysisloadEvent();

  @override
  List<Object?> get props => [];
}

final class AddStyleWordEvent extends AnalysisEvent {
  final Word word;

  AddStyleWordEvent({required this.word});

  @override
  List<Object?> get props => [word];
}

final class SelectesStyleEvent extends AnalysisEvent {
  final WordStyle style;

  SelectesStyleEvent({required this.style});

  @override
  List<Object?> get props => [style];
}

final class FloatingMenuEvent extends AnalysisEvent {
  final ToolsBar toolsBar;

  FloatingMenuEvent({required this.toolsBar});
  @override
  List<Object?> get props => [toolsBar];
}

final class CancelEvent extends AnalysisEvent {
  final bool back;
  CancelEvent(this.back);
  @override
  List<Object?> get props => [back];
}

final class CreateNewStyleEvent extends AnalysisEvent {
  final WordStyle style;
  CreateNewStyleEvent(this.style);
  @override
  List<Object?> get props => [style];
}

final class ReordableEvent extends AnalysisEvent {
  final int oldIndex;
  final int newIndex;
  ReordableEvent(this.oldIndex, this.newIndex);
  @override
  List<Object?> get props => [oldIndex, newIndex];
}

final class DeleteEvent extends AnalysisEvent {
  final WordStyle style;
  DeleteEvent(this.style);
  @override
  List<Object?> get props => [style];
}

final class IncreaseOrReduceEvent extends AnalysisEvent {
  final bool reduce;
  IncreaseOrReduceEvent(this.reduce);
  @override
  List<Object?> get props => [reduce];
}

final class ChangeModeNewLineEvent extends AnalysisEvent {
  ChangeModeNewLineEvent();
  @override
  List<Object?> get props => [];
}

final class EraserEvent extends AnalysisEvent {
  EraserEvent();
  @override
  List<Object?> get props => [];
}
