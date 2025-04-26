import 'dart:async';

import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
part 'analysis_event.dart';
part 'analysis_state.dart';

class AnalysisBloc extends Bloc<AnalysisEvent, AnalysisState> {
  AnalysisBloc({required this.idFragment}) : super(AnalysisLoading()) {
    on<AnalysisInitEvent>(_init);
    on<AnalysisloadEvent>(_page);
    on<AddStyleWordEvent>(_addStyle);
  }

  final int idFragment;
  late MainService _mainService;
  StreamSubscription? _subscription;
  List<Verse> text = [];

  Future<void> _init(
      AnalysisInitEvent event, Emitter<AnalysisState> emit) async {
    _mainService = GetIt.instance.get<MainService>();
    _subscription?.cancel();

    await Future.delayed(const Duration(seconds: 1));

    await _mainService.fetchVerses(idFragment).then((either) async {
      await either.fold(
        (failure) {},
        (stream) async {
          _subscription = stream.listen((verses) {
            text = verses;
            add(AnalysisloadEvent(verses: verses));
            _subscription?.cancel();
          }, onError: (error) {});
        },
      );
    });
  }

  Future<void> _addStyle(
      AddStyleWordEvent event, Emitter<AnalysisState> emit) async {
    Word newWord = event.word.copyWith(); //применение стиля и прочего к слову

    //логика обновления
    _mainService.putWord(newWord);
    List<Verse> newText = text
        .map((verse) => verse.copyWith(
            words:
                verse.words.map((e) => e == event.word ? newWord : e).toList()))
        .toList();

    text = newText;
    add(AnalysisloadEvent(verses: text));
  }

  Future<void> _page(
      AnalysisloadEvent event, Emitter<AnalysisState> emit) async {
    emit(AnalysisLoaded(
      verses: event.verses,
    ));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
