import 'package:data/data.dart';
import 'package:data/objectbox.g.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppDatabase {
  AppDatabase(this.store);

  final Store store;

  ///Book
  int putBook(BookLocal book) {
    return store.box<BookLocal>().put(book);
  }

  BookLocal? getBookById(int id) {
    return store.box<BookLocal>().get(id);
  }

  List<BookLocal> getBooks() {
    return store.box<BookLocal>().getAll();
  }

  ///Chapter
  int putChapter(ChapterLocal chapter) {
    return store.box<ChapterLocal>().put(chapter);
  }

  List<ChapterLocal> getChaptersForBook(int bookId) {
    return store
        .box<ChapterLocal>()
        .query(ChapterLocal_.bookId.equals(bookId))
        .build()
        .find();
  }

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
  List<int> putVerses(List<VerseLocal> verses) {
    return store.box<VerseLocal>().putMany(verses);
  }

  int putVerse(VerseLocal verse) {
    return store.box<VerseLocal>().put(verse);
  }

  VerseLocal? getVerseById(int id) {
    return store.box<VerseLocal>().get(id);
  }

  // List<VerseLocal> getVerseForBook(int bookId) {
  //   return store
  //       .box<VerseLocal>()
  //       .query(VerseLocal_.bookId.equals(bookId))
  //       .build()
  //       .find();
  // }

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
