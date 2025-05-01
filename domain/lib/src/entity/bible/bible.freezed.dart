// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Book {
  int get id => throw _privateConstructorUsedError;
  int get bookId => throw _privateConstructorUsedError;
  String get translate => throw _privateConstructorUsedError;
  String get bookName => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {int id,
      int bookId,
      String translate,
      String bookName,
      String shortName});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookId = null,
    Object? translate = null,
    Object? bookName = null,
    Object? shortName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      translate: null == translate
          ? _value.translate
          : translate // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int bookId,
      String translate,
      String bookName,
      String shortName});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookId = null,
    Object? translate = null,
    Object? bookName = null,
    Object? shortName = null,
  }) {
    return _then(_$BookImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      translate: null == translate
          ? _value.translate
          : translate // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BookImpl implements _Book {
  const _$BookImpl(
      {this.id = 0,
      this.bookId = 0,
      this.translate = '',
      this.bookName = '',
      this.shortName = ''});

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int bookId;
  @override
  @JsonKey()
  final String translate;
  @override
  @JsonKey()
  final String bookName;
  @override
  @JsonKey()
  final String shortName;

  @override
  String toString() {
    return 'Book(id: $id, bookId: $bookId, translate: $translate, bookName: $bookName, shortName: $shortName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.translate, translate) ||
                other.translate == translate) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, bookId, translate, bookName, shortName);

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);
}

abstract class _Book implements Book {
  const factory _Book(
      {final int id,
      final int bookId,
      final String translate,
      final String bookName,
      final String shortName}) = _$BookImpl;

  @override
  int get id;
  @override
  int get bookId;
  @override
  String get translate;
  @override
  String get bookName;
  @override
  String get shortName;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Chapter {
  int get id => throw _privateConstructorUsedError;
  int get bookId => throw _privateConstructorUsedError;
  int get chAapterId => throw _privateConstructorUsedError;
  List<Verse> get verses => throw _privateConstructorUsedError;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res, Chapter>;
  @useResult
  $Res call({int id, int bookId, int chAapterId, List<Verse> verses});
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res, $Val extends Chapter>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookId = null,
    Object? chAapterId = null,
    Object? verses = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      chAapterId: null == chAapterId
          ? _value.chAapterId
          : chAapterId // ignore: cast_nullable_to_non_nullable
              as int,
      verses: null == verses
          ? _value.verses
          : verses // ignore: cast_nullable_to_non_nullable
              as List<Verse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterImplCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$$ChapterImplCopyWith(
          _$ChapterImpl value, $Res Function(_$ChapterImpl) then) =
      __$$ChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int bookId, int chAapterId, List<Verse> verses});
}

/// @nodoc
class __$$ChapterImplCopyWithImpl<$Res>
    extends _$ChapterCopyWithImpl<$Res, _$ChapterImpl>
    implements _$$ChapterImplCopyWith<$Res> {
  __$$ChapterImplCopyWithImpl(
      _$ChapterImpl _value, $Res Function(_$ChapterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookId = null,
    Object? chAapterId = null,
    Object? verses = null,
  }) {
    return _then(_$ChapterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      chAapterId: null == chAapterId
          ? _value.chAapterId
          : chAapterId // ignore: cast_nullable_to_non_nullable
              as int,
      verses: null == verses
          ? _value._verses
          : verses // ignore: cast_nullable_to_non_nullable
              as List<Verse>,
    ));
  }
}

/// @nodoc

class _$ChapterImpl implements _Chapter {
  const _$ChapterImpl(
      {this.id = 0,
      this.bookId = 0,
      this.chAapterId = 0,
      final List<Verse> verses = const []})
      : _verses = verses;

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int bookId;
  @override
  @JsonKey()
  final int chAapterId;
  final List<Verse> _verses;
  @override
  @JsonKey()
  List<Verse> get verses {
    if (_verses is EqualUnmodifiableListView) return _verses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verses);
  }

  @override
  String toString() {
    return 'Chapter(id: $id, bookId: $bookId, chAapterId: $chAapterId, verses: $verses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.chAapterId, chAapterId) ||
                other.chAapterId == chAapterId) &&
            const DeepCollectionEquality().equals(other._verses, _verses));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, bookId, chAapterId,
      const DeepCollectionEquality().hash(_verses));

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      __$$ChapterImplCopyWithImpl<_$ChapterImpl>(this, _$identity);
}

abstract class _Chapter implements Chapter {
  const factory _Chapter(
      {final int id,
      final int bookId,
      final int chAapterId,
      final List<Verse> verses}) = _$ChapterImpl;

  @override
  int get id;
  @override
  int get bookId;
  @override
  int get chAapterId;
  @override
  List<Verse> get verses;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Verse {
  int get id => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  int get bookId => throw _privateConstructorUsedError;
  int get chapterId =>
      throw _privateConstructorUsedError; // @Default([]) List<Word> words,
// @Default('') String text,
  Fragment? get fragment => throw _privateConstructorUsedError;

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerseCopyWith<Verse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerseCopyWith<$Res> {
  factory $VerseCopyWith(Verse value, $Res Function(Verse) then) =
      _$VerseCopyWithImpl<$Res, Verse>;
  @useResult
  $Res call(
      {int id, int number, int bookId, int chapterId, Fragment? fragment});

  $FragmentCopyWith<$Res>? get fragment;
}

/// @nodoc
class _$VerseCopyWithImpl<$Res, $Val extends Verse>
    implements $VerseCopyWith<$Res> {
  _$VerseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? bookId = null,
    Object? chapterId = null,
    Object? fragment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      chapterId: null == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int,
      fragment: freezed == fragment
          ? _value.fragment
          : fragment // ignore: cast_nullable_to_non_nullable
              as Fragment?,
    ) as $Val);
  }

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FragmentCopyWith<$Res>? get fragment {
    if (_value.fragment == null) {
      return null;
    }

    return $FragmentCopyWith<$Res>(_value.fragment!, (value) {
      return _then(_value.copyWith(fragment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerseImplCopyWith<$Res> implements $VerseCopyWith<$Res> {
  factory _$$VerseImplCopyWith(
          _$VerseImpl value, $Res Function(_$VerseImpl) then) =
      __$$VerseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int number, int bookId, int chapterId, Fragment? fragment});

  @override
  $FragmentCopyWith<$Res>? get fragment;
}

/// @nodoc
class __$$VerseImplCopyWithImpl<$Res>
    extends _$VerseCopyWithImpl<$Res, _$VerseImpl>
    implements _$$VerseImplCopyWith<$Res> {
  __$$VerseImplCopyWithImpl(
      _$VerseImpl _value, $Res Function(_$VerseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? bookId = null,
    Object? chapterId = null,
    Object? fragment = freezed,
  }) {
    return _then(_$VerseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      chapterId: null == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int,
      fragment: freezed == fragment
          ? _value.fragment
          : fragment // ignore: cast_nullable_to_non_nullable
              as Fragment?,
    ));
  }
}

/// @nodoc

class _$VerseImpl implements _Verse {
  const _$VerseImpl(
      {this.id = 0,
      this.number = 0,
      this.bookId = 0,
      this.chapterId = 0,
      this.fragment = null});

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int number;
  @override
  @JsonKey()
  final int bookId;
  @override
  @JsonKey()
  final int chapterId;
// @Default([]) List<Word> words,
// @Default('') String text,
  @override
  @JsonKey()
  final Fragment? fragment;

  @override
  String toString() {
    return 'Verse(id: $id, number: $number, bookId: $bookId, chapterId: $chapterId, fragment: $fragment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId) &&
            (identical(other.fragment, fragment) ||
                other.fragment == fragment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, number, bookId, chapterId, fragment);

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerseImplCopyWith<_$VerseImpl> get copyWith =>
      __$$VerseImplCopyWithImpl<_$VerseImpl>(this, _$identity);
}

abstract class _Verse implements Verse {
  const factory _Verse(
      {final int id,
      final int number,
      final int bookId,
      final int chapterId,
      final Fragment? fragment}) = _$VerseImpl;

  @override
  int get id;
  @override
  int get number;
  @override
  int get bookId;
  @override
  int get chapterId; // @Default([]) List<Word> words,
// @Default('') String text,
  @override
  Fragment? get fragment;

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerseImplCopyWith<_$VerseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
