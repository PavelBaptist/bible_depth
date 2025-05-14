// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WordStyle {
  int get id => throw _privateConstructorUsedError;
  String get fontColor => throw _privateConstructorUsedError;
  String get borderColor => throw _privateConstructorUsedError;
  String get backgroundColor => throw _privateConstructorUsedError;
  bool get italics => throw _privateConstructorUsedError;
  bool get bold => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Create a copy of WordStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordStyleCopyWith<WordStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordStyleCopyWith<$Res> {
  factory $WordStyleCopyWith(WordStyle value, $Res Function(WordStyle) then) =
      _$WordStyleCopyWithImpl<$Res, WordStyle>;
  @useResult
  $Res call(
      {int id,
      String fontColor,
      String borderColor,
      String backgroundColor,
      bool italics,
      bool bold,
      int order});
}

/// @nodoc
class _$WordStyleCopyWithImpl<$Res, $Val extends WordStyle>
    implements $WordStyleCopyWith<$Res> {
  _$WordStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fontColor = null,
    Object? borderColor = null,
    Object? backgroundColor = null,
    Object? italics = null,
    Object? bold = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fontColor: null == fontColor
          ? _value.fontColor
          : fontColor // ignore: cast_nullable_to_non_nullable
              as String,
      borderColor: null == borderColor
          ? _value.borderColor
          : borderColor // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
      italics: null == italics
          ? _value.italics
          : italics // ignore: cast_nullable_to_non_nullable
              as bool,
      bold: null == bold
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordStyleImplCopyWith<$Res>
    implements $WordStyleCopyWith<$Res> {
  factory _$$WordStyleImplCopyWith(
          _$WordStyleImpl value, $Res Function(_$WordStyleImpl) then) =
      __$$WordStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String fontColor,
      String borderColor,
      String backgroundColor,
      bool italics,
      bool bold,
      int order});
}

/// @nodoc
class __$$WordStyleImplCopyWithImpl<$Res>
    extends _$WordStyleCopyWithImpl<$Res, _$WordStyleImpl>
    implements _$$WordStyleImplCopyWith<$Res> {
  __$$WordStyleImplCopyWithImpl(
      _$WordStyleImpl _value, $Res Function(_$WordStyleImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fontColor = null,
    Object? borderColor = null,
    Object? backgroundColor = null,
    Object? italics = null,
    Object? bold = null,
    Object? order = null,
  }) {
    return _then(_$WordStyleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fontColor: null == fontColor
          ? _value.fontColor
          : fontColor // ignore: cast_nullable_to_non_nullable
              as String,
      borderColor: null == borderColor
          ? _value.borderColor
          : borderColor // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
      italics: null == italics
          ? _value.italics
          : italics // ignore: cast_nullable_to_non_nullable
              as bool,
      bold: null == bold
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WordStyleImpl implements _WordStyle {
  const _$WordStyleImpl(
      {this.id = 0,
      this.fontColor = '',
      this.borderColor = '',
      this.backgroundColor = '',
      this.italics = false,
      this.bold = false,
      this.order = 0});

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String fontColor;
  @override
  @JsonKey()
  final String borderColor;
  @override
  @JsonKey()
  final String backgroundColor;
  @override
  @JsonKey()
  final bool italics;
  @override
  @JsonKey()
  final bool bold;
  @override
  @JsonKey()
  final int order;

  @override
  String toString() {
    return 'WordStyle(id: $id, fontColor: $fontColor, borderColor: $borderColor, backgroundColor: $backgroundColor, italics: $italics, bold: $bold, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordStyleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fontColor, fontColor) ||
                other.fontColor == fontColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.italics, italics) || other.italics == italics) &&
            (identical(other.bold, bold) || other.bold == bold) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fontColor, borderColor,
      backgroundColor, italics, bold, order);

  /// Create a copy of WordStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordStyleImplCopyWith<_$WordStyleImpl> get copyWith =>
      __$$WordStyleImplCopyWithImpl<_$WordStyleImpl>(this, _$identity);
}

abstract class _WordStyle implements WordStyle {
  const factory _WordStyle(
      {final int id,
      final String fontColor,
      final String borderColor,
      final String backgroundColor,
      final bool italics,
      final bool bold,
      final int order}) = _$WordStyleImpl;

  @override
  int get id;
  @override
  String get fontColor;
  @override
  String get borderColor;
  @override
  String get backgroundColor;
  @override
  bool get italics;
  @override
  bool get bold;
  @override
  int get order;

  /// Create a copy of WordStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordStyleImplCopyWith<_$WordStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
