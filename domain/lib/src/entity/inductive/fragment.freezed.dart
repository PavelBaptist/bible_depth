// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fragment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Fragment {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Verse> get text => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get bookId => throw _privateConstructorUsedError;
  String get bookName => throw _privateConstructorUsedError;

  /// Create a copy of Fragment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FragmentCopyWith<Fragment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FragmentCopyWith<$Res> {
  factory $FragmentCopyWith(Fragment value, $Res Function(Fragment) then) =
      _$FragmentCopyWithImpl<$Res, Fragment>;
  @useResult
  $Res call(
      {int id,
      String name,
      List<Verse> text,
      String description,
      int bookId,
      String bookName});
}

/// @nodoc
class _$FragmentCopyWithImpl<$Res, $Val extends Fragment>
    implements $FragmentCopyWith<$Res> {
  _$FragmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fragment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? text = null,
    Object? description = null,
    Object? bookId = null,
    Object? bookName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as List<Verse>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FragmentImplCopyWith<$Res>
    implements $FragmentCopyWith<$Res> {
  factory _$$FragmentImplCopyWith(
          _$FragmentImpl value, $Res Function(_$FragmentImpl) then) =
      __$$FragmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      List<Verse> text,
      String description,
      int bookId,
      String bookName});
}

/// @nodoc
class __$$FragmentImplCopyWithImpl<$Res>
    extends _$FragmentCopyWithImpl<$Res, _$FragmentImpl>
    implements _$$FragmentImplCopyWith<$Res> {
  __$$FragmentImplCopyWithImpl(
      _$FragmentImpl _value, $Res Function(_$FragmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fragment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? text = null,
    Object? description = null,
    Object? bookId = null,
    Object? bookName = null,
  }) {
    return _then(_$FragmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value._text
          : text // ignore: cast_nullable_to_non_nullable
              as List<Verse>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FragmentImpl implements _Fragment {
  const _$FragmentImpl(
      {this.id = 0,
      this.name = '',
      final List<Verse> text = const [],
      this.description = '',
      this.bookId = 0,
      this.bookName = ''})
      : _text = text;

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  final List<Verse> _text;
  @override
  @JsonKey()
  List<Verse> get text {
    if (_text is EqualUnmodifiableListView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_text);
  }

  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int bookId;
  @override
  @JsonKey()
  final String bookName;

  @override
  String toString() {
    return 'Fragment(id: $id, name: $name, text: $text, description: $description, bookId: $bookId, bookName: $bookName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FragmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._text, _text) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_text),
      description,
      bookId,
      bookName);

  /// Create a copy of Fragment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FragmentImplCopyWith<_$FragmentImpl> get copyWith =>
      __$$FragmentImplCopyWithImpl<_$FragmentImpl>(this, _$identity);
}

abstract class _Fragment implements Fragment {
  const factory _Fragment(
      {final int id,
      final String name,
      final List<Verse> text,
      final String description,
      final int bookId,
      final String bookName}) = _$FragmentImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  List<Verse> get text;
  @override
  String get description;
  @override
  int get bookId;
  @override
  String get bookName;

  /// Create a copy of Fragment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FragmentImplCopyWith<_$FragmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
