import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';
part 'analysis_event.dart';
part 'analysis_state.dart';

class AnalysisBloc extends Bloc<AnalysisEvent, AnalysisState> {
  AnalysisBloc({required this.idFragment})
      : super(const AnalysisLoading(
          toolsBar: null,
          tools: null,
          style: null,
          cashWord: [],
          secondCash: [],
          sizaText: 18,
          newLineByVerse: false,
        )) {
    on<AnalysisInitEvent>(_init);
    on<AnalysisloadEvent>(_page);
    on<AddStyleWordEvent>(_addStyle);
    on<FloatingMenuEvent>(_floatMenu);
    on<SelectesStyleEvent>(_selectStyle);
    on<CancelEvent>(_cancel);
    on<CreateNewStyleEvent>(_createStyle);
    on<ReordableEvent>(_reordable);
    on<DeleteEvent>(_deleteStyle);
    on<IncreaseOrReduceEvent>(_increaseOrReduce);
    on<ChangeModeNewLineEvent>(_changeModeNewLineEvent);
    on<EraserEvent>(_eraserMode);
  }

  final int idFragment;
  late MainService _mainService;
  StreamSubscription? _subscriptionWord;
  StreamSubscription? _subscriptionWordStyle;
  List<Word> text = [];
  List<WordStyle> wordStyles = [];
  ToolsBar? toolsBar;
  Tools? tool;
  WordStyle? style;
  List<Word> cashWord = [];
  List<Word> secondCash = [];
  double sizeText = 18;
  bool newLineByVerse = false;

  Future<void> _init(
      AnalysisInitEvent event, Emitter<AnalysisState> emit) async {
    _mainService = GetIt.instance.get<MainService>();
    _subscriptionWord?.cancel();
    _subscriptionWordStyle?.cancel();

    await _mainService.fetchFontSize().then((either) {
      either.fold(
        (failure) {},
        (size) {
          sizeText = size;
        },
      );
    });

    await _mainService.fetchNewLineMode().then((either) {
      either.fold(
        (failure) {},
        (mode) {
          newLineByVerse = mode;
        },
      );
    });

    await _mainService.fetchWordsForFragment(idFragment).then((either) async {
      await either.fold(
        (failure) {},
        (stream) async {
          _subscriptionWord = stream.listen((words) {
            text = words;
            add(AnalysisloadEvent());
          }, onError: (error) {});
        },
      );
    });

    await _mainService.fetchWordsStyle().then((either) async {
      await either.fold(
        (failure) {},
        (stream) async {
          _subscriptionWordStyle = stream.listen((words) {
            wordStyles = words;
            add(AnalysisloadEvent());
          }, onError: (error) {});
        },
      );
    });
  }

  Future<void> _floatMenu(
      FloatingMenuEvent event, Emitter<AnalysisState> emit) async {
    tool = null;
    if (event.toolsBar == toolsBar) {
      toolsBar = null;
    } else {
      toolsBar = event.toolsBar;
    }

    emit(AnalysisLoaded(
      words: text,
      wordStyles: wordStyles,
      toolsBar: toolsBar,
      tools: tool,
      style: style,
      cashWord: cashWord,
      secondCash: secondCash,
      sizaText: sizeText,
      newLineByVerse: newLineByVerse,
    ));
  }

  Future<void> _selectStyle(
      SelectesStyleEvent event, Emitter<AnalysisState> emit) async {
    tool = Tools.style;
    if (event.style == style) {
      style = null;
    } else {
      style = event.style;
    }

    emit(AnalysisLoaded(
      words: text,
      wordStyles: wordStyles,
      toolsBar: toolsBar,
      tools: tool,
      style: style,
      cashWord: cashWord,
      secondCash: secondCash,
      sizaText: sizeText,
      newLineByVerse: newLineByVerse,
    ));
  }

  Future<void> _addStyle(
      AddStyleWordEvent event, Emitter<AnalysisState> emit) async {
    if (tool == Tools.style && style != null) {
      cashWord.add(event.word);
      secondCash.clear();
      if (event.word.fontColor == style!.fontColor &&
          event.word.borderColor == style!.borderColor &&
          event.word.backgroundColor == style!.backgroundColor &&
          event.word.bold == style!.bold &&
          event.word.italics == style!.italics) {
        _mainService.putWord(event.word.copyWith(
          fontColor: '',
          borderColor: '',
          backgroundColor: '',
          bold: false,
          italics: false,
        ));
      } else {
        _mainService.putWord(event.word.copyWith(
          fontColor: style!.fontColor,
          borderColor: style!.borderColor,
          backgroundColor: style!.backgroundColor,
          bold: style!.bold,
          italics: style!.italics,
        ));
      }
    }
    if (toolsBar == ToolsBar.enter) {
      cashWord.add(event.word);
      secondCash.clear();
      _mainService.putWord(event.word.copyWith(
        transfer: !event.word.transfer,
      ));
    }
    if (toolsBar == ToolsBar.pencil && tool == Tools.eraser) {
      _mainService.putWord(event.word.copyWith(
        fontColor: '',
        borderColor: '',
        backgroundColor: '',
        bold: false,
        italics: false,
        transfer: false,
      ));
    }
  }

  Future<void> _page(
      AnalysisloadEvent event, Emitter<AnalysisState> emit) async {
    emit(AnalysisLoaded(
      words: text,
      wordStyles: wordStyles,
      toolsBar: toolsBar,
      tools: tool,
      style: style,
      cashWord: cashWord,
      secondCash: secondCash,
      sizaText: sizeText,
      newLineByVerse: newLineByVerse,
    ));
  }

  Future<void> _cancel(CancelEvent event, Emitter<AnalysisState> emit) async {
    if (event.back) {
      secondCash.add(text.firstWhere((e) => e.id == cashWord.last.id));
      _mainService.putWord(cashWord.removeLast());
    } else {
      cashWord.add(text.firstWhere((e) => e.id == secondCash.last.id));
      _mainService.putWord(secondCash.removeLast());
    }
  }

  Future<void> _createStyle(
      CreateNewStyleEvent event, Emitter<AnalysisState> emit) async {
    _mainService.putWordStyle(event.style.copyWith(order: wordStyles.length));
  }

  Future<void> _deleteStyle(
      DeleteEvent event, Emitter<AnalysisState> emit) async {
    _mainService.deleteWordStyle(event.style);
    if (style == event.style) {
      style = null;
    }
  }

  Future<void> _reordable(
      ReordableEvent event, Emitter<AnalysisState> emit) async {
    if (event.oldIndex != 0 && event.newIndex != event.oldIndex) {
      int newIndex = event.newIndex == 0 ? 0 : event.newIndex - 1;
      int oldIndex = event.oldIndex - 1;
      if (event.oldIndex < event.newIndex) {
        event.newIndex == 0
            ? newIndex = event.newIndex - 1
            : newIndex = event.newIndex - 2;
      }
      final item = wordStyles.removeAt(oldIndex);
      wordStyles.insert(newIndex, item);

      int firstIndex = newIndex > oldIndex ? oldIndex : newIndex;
      int secondIndex = newIndex > oldIndex ? newIndex : oldIndex;

      for (int i = firstIndex; i <= secondIndex; i++) {
        wordStyles[i] = wordStyles[i].copyWith(order: i);
      }

      emit(AnalysisLoaded(
        words: text,
        wordStyles: wordStyles,
        toolsBar: toolsBar,
        tools: tool,
        style: style,
        cashWord: cashWord,
        secondCash: secondCash,
        sizaText: sizeText,
        newLineByVerse: newLineByVerse,
      ));

      _mainService
          .putWordsStyle(wordStyles.sublist(firstIndex, secondIndex + 1));
    }
  }

  Future<void> _increaseOrReduce(
      IncreaseOrReduceEvent event, Emitter<AnalysisState> emit) async {
    if (event.reduce) {
      if (sizeText > 6) {
        sizeText--;
        _mainService.putFontSize(sizeText);
      }
    } else {
      if (sizeText < 32) {
        sizeText++;
        _mainService.putFontSize(sizeText);
      }
    }

    emit(AnalysisLoaded(
      words: text,
      wordStyles: wordStyles,
      toolsBar: toolsBar,
      tools: tool,
      style: style,
      cashWord: cashWord,
      secondCash: secondCash,
      sizaText: sizeText,
      newLineByVerse: newLineByVerse,
    ));
  }

  Future<void> _changeModeNewLineEvent(
      ChangeModeNewLineEvent event, Emitter<AnalysisState> emit) async {
    newLineByVerse = !newLineByVerse;
    _mainService.putNewLineMode(newLineByVerse);

    emit(AnalysisLoaded(
      words: text,
      wordStyles: wordStyles,
      toolsBar: toolsBar,
      tools: tool,
      style: style,
      cashWord: cashWord,
      secondCash: secondCash,
      sizaText: sizeText,
      newLineByVerse: newLineByVerse,
    ));
  }

  Future<void> _eraserMode(
      EraserEvent event, Emitter<AnalysisState> emit) async {
    if (tool == Tools.eraser) {
      tool = null;
    } else {
      tool = Tools.eraser;
    }

    emit(AnalysisLoaded(
      words: text,
      wordStyles: wordStyles,
      toolsBar: toolsBar,
      tools: tool,
      style: style,
      cashWord: cashWord,
      secondCash: secondCash,
      sizaText: sizeText,
      newLineByVerse: newLineByVerse,
    ));
  }

  @override
  Future<void> close() {
    _subscriptionWord?.cancel();
    _subscriptionWordStyle?.cancel();
    return super.close();
  }
}
