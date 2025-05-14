import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'word_style.freezed.dart';

@freezed
class WordStyle with _$WordStyle {
  const factory WordStyle({
    @Default(0) int id,
    @Default('') String fontColor,
    @Default('') String borderColor,
    @Default('') String backgroundColor,
    @Default(false) bool italics,
    @Default(false) bool bold,
    @Default(0) int order,
  }) = _WordStyle;
}

extension WordStyleExt on WordStyle {
  Color? get getFontColor => hexToColor(fontColor);
  Color? get getBorderColor => hexToColor(borderColor);
  Color? get getBackgroundColor => hexToColor(backgroundColor);
}
