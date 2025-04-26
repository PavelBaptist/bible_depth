import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fragment.freezed.dart';

@freezed
class Fragment with _$Fragment {
  const factory Fragment({
    @Default(0) int id,
    @Default('') String name,
    @Default([]) List<Verse> text,
    @Default('') String description,
    @Default(0) int bookId,
    @Default('') String bookName,
    @Default('') String shortBookName,
    @Default(Folder()) Folder folder,
  }) = _Fragment;
}
