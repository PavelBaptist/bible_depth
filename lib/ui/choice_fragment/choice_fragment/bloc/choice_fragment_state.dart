part of 'choice_fragment_bloc.dart';

@immutable
sealed class ChoiceFragmentState extends Equatable {}

final class ChoiceFragmentView extends ChoiceFragmentState {
  final Fragment? fragment;
  final String linkText;

  ChoiceFragmentView({required this.fragment, required this.linkText});
  @override
  List<Object?> get props => [fragment, linkText];
}
