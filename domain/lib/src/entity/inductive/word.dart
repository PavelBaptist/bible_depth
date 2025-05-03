import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';

@freezed
class Word with _$Word {
  const factory Word({
    @Default(0) int id,
    @Default(Verse()) Verse verse,
    @Default(Fragment()) Fragment fragment,
    @Default('') String value,
  }) = _word;
}
