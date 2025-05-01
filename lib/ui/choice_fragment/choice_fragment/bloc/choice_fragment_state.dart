part of 'choice_fragment_bloc.dart';

@immutable
sealed class ChoiceFragmentState extends Equatable {}

final class ChoiceFragmentLoading extends ChoiceFragmentState {
  ChoiceFragmentLoading();
  @override
  List<Object?> get props => [];
}

final class ChoiceFragmentView extends ChoiceFragmentState {
  final Fragment? fragment;
  final String linkText;
  final List<Chapter> chapters;

  ChoiceFragmentView(
      {required this.fragment, required this.linkText, required this.chapters});
  @override
  List<Object?> get props => [fragment, linkText, chapters];
}
