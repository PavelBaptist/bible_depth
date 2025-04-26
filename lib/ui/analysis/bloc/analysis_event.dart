part of 'analysis_bloc.dart';

@immutable
sealed class AnalysisEvent extends Equatable {}

final class AnalysisInitEvent extends AnalysisEvent {
  @override
  List<Object?> get props => [];
}

final class AnalysisloadEvent extends AnalysisEvent {
  final List<Verse> verses;

  AnalysisloadEvent({required this.verses});

  @override
  List<Object?> get props => [verses];
}

final class AddStyleWordEvent extends AnalysisEvent {
  final Word word;

  AddStyleWordEvent({required this.word});

  @override
  List<Object?> get props => [word];
}
