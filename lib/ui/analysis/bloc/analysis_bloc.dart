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
  List<Map<String, List<Word>>> cashWord = [];
  List<Map<String, List<Word>>> secondCash = [];
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
    style = null;
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
      secondCash.clear();
      if (event.word.fontColor == style!.fontColor &&
          event.word.borderColor == style!.borderColor &&
          event.word.backgroundColor == style!.backgroundColor &&
          event.word.bold == style!.bold &&
          event.word.italics == style!.italics) {
        List<String> values = event.word.value.split(' ').toList();
        if (values.length < 2) {
          Word newWord = event.word.copyWith(
            fontColor: '',
            borderColor: '',
            backgroundColor: '',
            bold: false,
            italics: false,
          );
          cashWord.add({
            'oldElems': [event.word],
            'newElems': [newWord],
          });
          _mainService.putWord(newWord);
        } else {
          int order = event.word.order;
          List<Word> newWords = values
              .map((e) => event.word.copyWith(
                    id: 0,
                    value: e,
                    order: order++,
                    fontColor: '',
                    borderColor: '',
                    backgroundColor: '',
                    bold: false,
                    italics: false,
                    transfer: order - 1 == event.word.order
                        ? event.word.transfer
                        : false,
                  ))
              .toList();
          cashWord.add({
            'oldElems': [event.word],
            'newElems': newWords,
          });
          _mainService.deleteWords([event.word]);
          _mainService.putManyWords(newWords);
        }
      } else {
        int index = text.indexOf(event.word);
        Word newWord = event.word.copyWith(
          fontColor: style!.fontColor,
          borderColor: style!.borderColor,
          backgroundColor: style!.backgroundColor,
          bold: style!.bold,
          italics: style!.italics,
        );
        List<Word> remove = [];
        bool beforRecurring = false;
        Word before = const Word();
        Word after = const Word();

        cashWord.add({
          'oldElems': [event.word],
          'newElems': [],
        });

        if (index > 0 && !newWord.transfer) {
          before = text[index - 1];
          if (_checkRecurringStyle(before, newWord) &&
              newWord.verse.number == before.verse.number &&
              before.value.split(' ').toList().length +
                      newWord.value.split(' ').toList().length <=
                  3) {
            cashWord.last['oldElems']!.add(before.copyWith());
            before = before.copyWith(value: '${before.value} ${newWord.value}');
            remove.add(event.word);
            beforRecurring = true;
          }
        }
        if (index < text.length - 1) {
          after = text[index + 1];
          if (_checkRecurringStyle(newWord, after) &&
              !after.transfer &&
              newWord.verse.number == after.verse.number) {
            if (beforRecurring) {
              if (before.value.split(' ').toList().length +
                      after.value.split(' ').toList().length <=
                  3) {
                cashWord.last['oldElems']!.add(after.copyWith());
                before =
                    before.copyWith(value: '${before.value} ${after.value}');
                remove.add(after);
              }
            } else {
              if (newWord.value.split(' ').toList().length +
                      after.value.split(' ').toList().length <=
                  3) {
                cashWord.last['oldElems']!.add(after.copyWith());
                newWord =
                    newWord.copyWith(value: '${newWord.value} ${after.value}');
                remove.add(after);
              }
            }
          }
        }
        cashWord.last['newElems'] = beforRecurring ? [before] : [newWord];
        _mainService.putWord(beforRecurring ? before : newWord);
        if (remove.isNotEmpty) {
          _mainService.deleteWords(remove);
        }
      }
    }
    if (toolsBar == ToolsBar.enter) {
      Word newWord = event.word.copyWith(
        transfer: !event.word.transfer,
      );
      cashWord.add({
        'oldElems': [event.word],
        'newElems': [newWord],
      });
      secondCash.clear();
      _mainService.putWord(newWord);
    }
    if (toolsBar == ToolsBar.pencil && tool == Tools.eraser) {
      List<String> values = event.word.value.split(' ').toList();
      if (values.length < 2) {
        _mainService.putWord(event.word.copyWith(
          fontColor: '',
          borderColor: '',
          backgroundColor: '',
          bold: false,
          italics: false,
        ));
      } else {
        int order = event.word.order;
        _mainService.deleteWords([event.word]);
        _mainService.putManyWords(values
            .map((e) => event.word.copyWith(
                  id: 0,
                  value: e,
                  order: order++,
                  fontColor: '',
                  borderColor: '',
                  backgroundColor: '',
                  bold: false,
                  italics: false,
                  transfer: false,
                ))
            .toList());
      }
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
      List<Word> oldWords = cashWord.last['oldElems'] ?? [];
      List<Word> newWords = cashWord.last['newElems'] ?? [];
      newWords = newWords
          .map((e) => text.firstWhere((word) => word.order == e.order))
          .toList();
      secondCash.add(cashWord.removeLast());
      _mainService.deleteWords(newWords);
      _mainService.putManyWords(oldWords);
    } else {
      List<Word> oldWords = secondCash.last['oldElems'] ?? [];
      List<Word> newWords = secondCash.last['newElems'] ?? [];
      cashWord.add(secondCash.removeLast());
      _mainService.deleteWords(oldWords);
      _mainService.putManyWords(newWords);
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

  bool _checkRecurringStyle(Word first, Word second) {
    return (first.bold == second.bold &&
        first.italics == second.italics &&
        first.backgroundColor == second.backgroundColor &&
        first.borderColor == second.borderColor &&
        first.fontColor == second.fontColor);
  }

  @override
  Future<void> close() {
    _subscriptionWord?.cancel();
    _subscriptionWordStyle?.cancel();
    return super.close();
  }
}
