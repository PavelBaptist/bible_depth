// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(number) => "Глава ${number}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("добавить"),
        "addAnalysis": MessageLookupByLibrary.simpleMessage("+Добавить разбор"),
        "bibleDepth": MessageLookupByLibrary.simpleMessage("BIBLE DEPTH"),
        "bold": MessageLookupByLibrary.simpleMessage("Жирный"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "choiceBook":
            MessageLookupByLibrary.simpleMessage("ВЫБЕРИТЕ КНИГУ БИБЛИИ"),
        "colorBackground": MessageLookupByLibrary.simpleMessage("Цвет фона"),
        "colorBorder": MessageLookupByLibrary.simpleMessage("Цвет обводки"),
        "colorFont": MessageLookupByLibrary.simpleMessage("Цвет текста"),
        "create": MessageLookupByLibrary.simpleMessage("Создать"),
        "createNewFolder":
            MessageLookupByLibrary.simpleMessage("Создать новую папку"),
        "createNewStyle":
            MessageLookupByLibrary.simpleMessage("Создайте новый стиль"),
        "delete": MessageLookupByLibrary.simpleMessage("Удаление"),
        "deleteTitleButton": MessageLookupByLibrary.simpleMessage("Удалить"),
        "emptyFolder":
            MessageLookupByLibrary.simpleMessage("У тебя ещё нет разборов"),
        "haveNotFolders": MessageLookupByLibrary.simpleMessage(
            "У вас пока нет папок с разборами, создайте новую"),
        "italics": MessageLookupByLibrary.simpleMessage("Курсивный"),
        "myAnalysis": MessageLookupByLibrary.simpleMessage("MY ANALYSIS"),
        "name": MessageLookupByLibrary.simpleMessage("Название"),
        "numberChapter": m0,
        "sample": MessageLookupByLibrary.simpleMessage("Образец"),
        "selectAnExcerptToStudy": MessageLookupByLibrary.simpleMessage(
            "Выберите отрывок для изучения"),
        "selectFolder": MessageLookupByLibrary.simpleMessage("Выберите папку"),
        "startTheDive": MessageLookupByLibrary.simpleMessage("STRAR THE DIVE")
      };
}
