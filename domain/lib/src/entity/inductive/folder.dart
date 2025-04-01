import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder.freezed.dart';

@freezed
class Folder with _$Folder {
  const factory Folder({
    @Default(0) int id,
    @Default('') String name,
    @Default([]) List<Fragment> fragments,
  }) = _Folder;
}
