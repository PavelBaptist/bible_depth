import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class InductiveLocalDataSource {
  InductiveLocalDataSource(this._appDatabase);

  final AppDatabase _appDatabase;

  Stream<List<FolderLocal>> fetchAllFolders() => _appDatabase.getFolders();

  int putFolder(FolderLocal folder) => _appDatabase.putFolder(folder);
}
