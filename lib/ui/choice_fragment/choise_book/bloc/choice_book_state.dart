part of 'choice_book_bloc.dart';

@immutable
sealed class ChoiceBookState extends Equatable {}

final class ChoiceBookLoading extends ChoiceBookState {
  @override
  List<Object?> get props => [];
}

final class ChoiceBookLoaded extends ChoiceBookState {
  final List<Book> books;

  ChoiceBookLoaded({required this.books});

  @override
  List<Object?> get props => [books];
}
