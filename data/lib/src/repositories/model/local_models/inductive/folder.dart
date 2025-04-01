// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class FolderLocal {
  FolderLocal({
    this.id = 0,
    required this.name,
  });

  @Id()
  int id;
  String name;
  final fragments = ToMany<FragmentLocal>();
}

extension FolderMapper on Folder {
  FolderLocal toLocalFolder() {
    FolderLocal folder = FolderLocal(
      id: id,
      name: name,
    );
    folder.fragments.addAll(fragments.map((e) => e.toLocalFragment()).toList());
    return folder;
  }
}

extension LocalFolderDataMapper on FolderLocal {
  Folder toFolder() {
    return Folder(
      name: name,
      fragments: fragments.map((e) => e.toFragment()).toList(),
    );
  }
}
