import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bible.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book({
    @Default(0) int id,
    @Default(0) int bookId,
    @Default('') String translate,
    @Default('') String bookName,
    @Default('') String shortName,
  }) = _Book;
}

@freezed
class Chapter with _$Chapter {
  const factory Chapter({
    @Default(0) int id,
    @Default(0) int bookId,
    @Default(0) int chAapterId,
    @Default([]) List<Verse> verses,
  }) = _Chapter;
}

@freezed
class Verse with _$Verse {
  const factory Verse({
    @Default(0) int id,
    @Default(0) int number,
    @Default(0) int bookId,
    @Default(0) int chapterId,
    // @Default([]) List<Word> words,
    // @Default('') String text,
    @Default(null) Fragment? fragment,
  }) = _Verse;
}
