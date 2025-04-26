import 'package:data/data.dart';
import 'package:data/objectbox.g.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppDatabase {
  AppDatabase(this.store);

  final Store store;

  ///Folder
  int putFolder(FolderLocal folder) {
    return store.box<FolderLocal>().put(folder);
  }

  FolderLocal? getFolderById(int id) {
    return store.box<FolderLocal>().get(id);
  }

  Stream<List<FolderLocal>> getFolders() {
    final builder = store.box<FolderLocal>().query();
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  ///Fragment
  int putFragment(FragmentLocal fragment) {
    return store.box<FragmentLocal>().put(fragment);
  }

  FragmentLocal? getFragmentById(int id) {
    return store.box<FragmentLocal>().get(id);
  }

  Stream<List<FragmentLocal>> getFragment(int folderId) {
    final builder = store
        .box<FragmentLocal>()
        .query(FragmentLocal_.folder.equals(folderId));
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  ///Verse
  List<int> putVerse(List<VerseLocal> verses) {
    return store.box<VerseLocal>().putMany(verses);
  }

  VerseLocal? getVerseById(int id) {
    return store.box<VerseLocal>().get(id);
  }

  Stream<List<VerseLocal>> getVerse(int fragmentId) {
    final builder =
        store.box<VerseLocal>().query(VerseLocal_.fragment.equals(fragmentId));
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  ///Word
  int putWord(WordLocal word) {
    return store.box<WordLocal>().put(word);
  }

  Stream<List<WordLocal>> getWords() {
    final builder = store.box<WordLocal>().query();
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
