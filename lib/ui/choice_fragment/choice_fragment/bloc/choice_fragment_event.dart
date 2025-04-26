part of 'choice_fragment_bloc.dart';

@immutable
sealed class ChoiceFragmentEvent extends Equatable {}

final class ChoiceFragmentSelectVerse extends ChoiceFragmentEvent {
  final Verse verse;
  ChoiceFragmentSelectVerse({required this.verse});
  @override
  List<Object?> get props => [verse];
}

final class CreateNewFolderAndFragment extends ChoiceFragmentEvent {
  final String name;
  CreateNewFolderAndFragment({required this.name});
  @override
  List<Object?> get props => [name];
}

final class CreateNewFragment extends ChoiceFragmentEvent {
  final Folder folder;
  CreateNewFragment({required this.folder});
  @override
  List<Object?> get props => [folder];
}
