import 'dart:async';

import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
part 'choice_fragment_event.dart';
part 'choice_fragment_state.dart';

class ChoiceFragmentBloc
    extends Bloc<ChoiceFragmentEvent, ChoiceFragmentState> {
  ChoiceFragmentBloc({required this.book})
      : super(ChoiceFragmentView(fragment: null, linkText: '')) {
    on<ChoiceFragmentSelectVerse>(_selectVerse);
    on<CreateNewFolderAndFragment>(_createNewFolder);
    on<CreateNewFragment>(_createNewFragment);
  }

  final Book book;
  late BibleService _bibleService;
  Verse? firstVerse;
  Verse? secondVerse;
  Fragment? fragment;

  Future<void> _selectVerse(ChoiceFragmentSelectVerse event,
      Emitter<ChoiceFragmentState> emit) async {
    if (firstVerse == null || secondVerse != null) {
      firstVerse = event.verse;
      secondVerse = null;
      fragment = Fragment(
        text: [event.verse],
        shortBookName: book.shortName,
      );
    } else {
      if (firstVerse!.chapterId > event.verse.chapterId ||
          (firstVerse!.chapterId == event.verse.chapterId &&
              firstVerse!.number > event.verse.number)) {
        secondVerse = firstVerse;
        firstVerse = event.verse;
      } else {
        secondVerse = event.verse;
      }
      List<Verse> verses = [];
      for (int chapter = firstVerse!.chapterId;
          chapter <= secondVerse!.chapterId;
          chapter++) {
        for (final verse in book.chapters[chapter - 1].verses) {
          if (verse.chapterId >= firstVerse!.chapterId &&
              verse.chapterId <= secondVerse!.chapterId &&
              (verse.number >= firstVerse!.number ||
                  verse.chapterId > firstVerse!.chapterId) &&
              (verse.number <= secondVerse!.number ||
                  verse.chapterId < secondVerse!.chapterId)) {
            verses.add(verse);
          }
        }
      }
      fragment = Fragment(
        text: verses,
        shortBookName: book.shortName,
      );
    }
    emit(ChoiceFragmentView(fragment: fragment, linkText: linkText()));
  }

  Future<void> _createNewFolder(CreateNewFolderAndFragment event,
      Emitter<ChoiceFragmentState> emit) async {
    _bibleService = GetIt.instance.get<BibleService>();
    final successOrFailure = _bibleService.putFolder(Folder(name: event.name));
    successOrFailure.fold(
      (l) {},
      (r) {
        putFragment(r);
      },
    );
  }

  Future<void> _createNewFragment(
      CreateNewFragment event, Emitter<ChoiceFragmentState> emit) async {
    _bibleService = GetIt.instance.get<BibleService>();
    putFragment(event.folder);
  }

  void putFragment(Folder folder) {
    _bibleService.putFragment(
      fragment!.copyWith(
        bookId: book.id,
        folder: folder,
        bookName: book.bookName,
        name: linkText(),
      ),
    );
  }

  String linkText() {
    if (fragment == null) {
      return '';
    } else {
      String firstLink =
          '${fragment!.text.first.chapterId}:${fragment!.text.first.number}';
      String secondLink = fragment!.text.length > 1
          ? ' - ${fragment!.text.last.chapterId}:${fragment!.text.last.number}'
          : '';
      return '${fragment!.shortBookName} $firstLink$secondLink';
    }
  }
}
