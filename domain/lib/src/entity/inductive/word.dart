import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';

@freezed
class Word with _$Word {
  const factory Word({
    @Default(0) int id,
    @Default('') String value,
  }) = _word;
}
