part of 'analysis_bloc.dart';

@immutable
sealed class AnalysisState extends Equatable {}

final class AnalysisLoading extends AnalysisState {
  @override
  List<Object?> get props => [];
}

final class AnalysisLoaded extends AnalysisState {
  final List<Word> words;

  AnalysisLoaded({required this.words});

  @override
  List<Object?> get props => [words];
}
