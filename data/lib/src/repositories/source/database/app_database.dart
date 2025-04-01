import 'package:data/data.dart';
import 'package:data/objectbox.g.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppDatabase {
  AppDatabase(this.store);

  final Store store;

  ///USER
  int putFolder(FolderLocal folder) {
    return store.box<FolderLocal>().put(folder);
  }

  Stream<List<FolderLocal>> getFolders() {
    final builder = store.box<FolderLocal>().query();
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
