part of 'choice_book_bloc.dart';

@immutable
sealed class ChoiceBookEvent extends Equatable {}

final class ChoiceBookInitEvent extends ChoiceBookEvent {
  @override
  List<Object?> get props => [];
}

final class ChoiceBookloadEvent extends ChoiceBookEvent {
  final List<Book> books;

  ChoiceBookloadEvent({required this.books});

  @override
  List<Object?> get props => [books];
}
