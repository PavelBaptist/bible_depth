import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'word.freezed.dart';

@freezed
class Word with _$Word {
  const factory Word({
    @Default(0) int id,
    @Default(Verse()) Verse verse,
    @Default(Fragment()) Fragment fragment,
    @Default('') String value,
    @Default('') String fontColor,
    @Default('') String borderColor,
    @Default('') String backgroundColor,
    @Default(false) bool italics,
    @Default(false) bool bold,
    @Default(false) bool transfer,
  }) = _word;
}

extension WordExt on Word {
  Color? get getFontColor => hexToColor(fontColor);
  Color? get getBorderColor => hexToColor(borderColor);
  Color? get getBackgroundColor => hexToColor(backgroundColor);
}
