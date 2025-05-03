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
  List<Word> text = [];

  Future<void> _init(
      AnalysisInitEvent event, Emitter<AnalysisState> emit) async {
    _mainService = GetIt.instance.get<MainService>();
    _subscription?.cancel();

    // await Future.delayed(const Duration(milliseconds: 100));

    await _mainService.fetchWordsForFragment(idFragment).then((either) async {
      await either.fold(
        (failure) {},
        (stream) async {
          _subscription = stream.listen((words) {
            text = words;
            add(AnalysisloadEvent(words: words));
          }, onError: (error) {});
        },
      );
    });
  }

  Future<void> _addStyle(
      AddStyleWordEvent event, Emitter<AnalysisState> emit) async {
    // if (event.word.value.contains('!')) {
    //   _mainService.putWord(event.word.copyWith(
    //       value: event.word.value.substring(0, event.word.value.length - 1)));
    // } else {
    //   _mainService.putWord(event.word.copyWith(value: '${event.word.value}!'));
    // }
  }

  Future<void> _page(
      AnalysisloadEvent event, Emitter<AnalysisState> emit) async {
    emit(AnalysisLoaded(
      words: event.words,
    ));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
