import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
part 'choice_book_event.dart';
part 'choice_book_state.dart';

class ChoiceBookBloc extends Bloc<ChoiceBookEvent, ChoiceBookState> {
  ChoiceBookBloc() : super(ChoiceBookLoading()) {
    on<ChoiceBookInitEvent>(_init);
    on<ChoiceBookloadEvent>(_page);
  }

  late BibleService _bibleService;

  Future<void> _init(
      ChoiceBookInitEvent event, Emitter<ChoiceBookState> emit) async {
    _bibleService = GetIt.instance.get<BibleService>();

    await _bibleService.getBible().then((either) async {
      either.fold(
        (l) {
          GetIt.I<Talker>().handle(l);
        },
        (r) {
          add(ChoiceBookloadEvent(books: r));
        },
      );
    });
  }

  Future<void> _page(
      ChoiceBookloadEvent event, Emitter<ChoiceBookState> emit) async {
    emit(ChoiceBookLoaded(
      books: event.books,
    ));
  }
}
