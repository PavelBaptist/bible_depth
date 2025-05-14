part of 'analysis_bloc.dart';

@immutable
sealed class AnalysisState extends Equatable {
  final ToolsBar? toolsBar;
  final Tools? tools;
  final WordStyle? style;
  final List<Word> cashWord;
  final List<Word> secondCash;
  final double sizaText;
  final bool newLineByVerse;

  const AnalysisState({
    required this.toolsBar,
    required this.tools,
    required this.style,
    required this.cashWord,
    required this.secondCash,
    required this.sizaText,
    required this.newLineByVerse,
  });

  @override
  List<Object?> get props => [
        toolsBar,
        tools,
        style,
        cashWord,
        secondCash,
        sizaText,
        newLineByVerse,
      ];
}

final class AnalysisLoading extends AnalysisState {
  const AnalysisLoading({
    required super.toolsBar,
    required super.tools,
    required super.style,
    required super.cashWord,
    required super.secondCash,
    required super.sizaText,
    required super.newLineByVerse,
  });

  @override
  List<Object?> get props => [
        toolsBar,
        tools,
        style,
        cashWord,
        secondCash,
        sizaText,
        newLineByVerse,
      ];
}

final class AnalysisLoaded extends AnalysisState {
  final List<Word> words;
  final List<WordStyle> wordStyles;

  const AnalysisLoaded({
    required this.words,
    required this.wordStyles,
    required super.toolsBar,
    required super.tools,
    required super.style,
    required super.cashWord,
    required super.secondCash,
    required super.sizaText,
    required super.newLineByVerse,
  });

  @override
  List<Object?> get props => [
        words,
        wordStyles,
        toolsBar,
        tools,
        style,
        cashWord,
        secondCash,
        sizaText,
        newLineByVerse,
      ];
}
