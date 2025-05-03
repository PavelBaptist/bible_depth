// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Word {
  int get id => throw _privateConstructorUsedError;
  Verse get verse => throw _privateConstructorUsedError;
  Fragment get fragment => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res, Word>;
  @useResult
  $Res call({int id, Verse verse, Fragment fragment, String value});

  $VerseCopyWith<$Res> get verse;
  $FragmentCopyWith<$Res> get fragment;
}

/// @nodoc
class _$WordCopyWithImpl<$Res, $Val extends Word>
    implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? verse = null,
    Object? fragment = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      verse: null == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as Verse,
      fragment: null == fragment
          ? _value.fragment
          : fragment // ignore: cast_nullable_to_non_nullable
              as Fragment,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerseCopyWith<$Res> get verse {
    return $VerseCopyWith<$Res>(_value.verse, (value) {
      return _then(_value.copyWith(verse: value) as $Val);
    });
  }

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FragmentCopyWith<$Res> get fragment {
    return $FragmentCopyWith<$Res>(_value.fragment, (value) {
      return _then(_value.copyWith(fragment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$wordImplCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$wordImplCopyWith(
          _$wordImpl value, $Res Function(_$wordImpl) then) =
      __$$wordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Verse verse, Fragment fragment, String value});

  @override
  $VerseCopyWith<$Res> get verse;
  @override
  $FragmentCopyWith<$Res> get fragment;
}

/// @nodoc
class __$$wordImplCopyWithImpl<$Res>
    extends _$WordCopyWithImpl<$Res, _$wordImpl>
    implements _$$wordImplCopyWith<$Res> {
  __$$wordImplCopyWithImpl(_$wordImpl _value, $Res Function(_$wordImpl) _then)
      : super(_value, _then);

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? verse = null,
    Object? fragment = null,
    Object? value = null,
  }) {
    return _then(_$wordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      verse: null == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as Verse,
      fragment: null == fragment
          ? _value.fragment
          : fragment // ignore: cast_nullable_to_non_nullable
              as Fragment,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$wordImpl implements _word {
  const _$wordImpl(
      {this.id = 0,
      this.verse = const Verse(),
      this.fragment = const Fragment(),
      this.value = ''});

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final Verse verse;
  @override
  @JsonKey()
  final Fragment fragment;
  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'Word(id: $id, verse: $verse, fragment: $fragment, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$wordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.verse, verse) || other.verse == verse) &&
            (identical(other.fragment, fragment) ||
                other.fragment == fragment) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, verse, fragment, value);

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$wordImplCopyWith<_$wordImpl> get copyWith =>
      __$$wordImplCopyWithImpl<_$wordImpl>(this, _$identity);
}

abstract class _word implements Word {
  const factory _word(
      {final int id,
      final Verse verse,
      final Fragment fragment,
      final String value}) = _$wordImpl;

  @override
  int get id;
  @override
  Verse get verse;
  @override
  Fragment get fragment;
  @override
  String get value;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$wordImplCopyWith<_$wordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
