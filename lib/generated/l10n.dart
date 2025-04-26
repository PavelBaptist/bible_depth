// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BIBLE DEPTH`
  String get bibleDepth {
    return Intl.message(
      'BIBLE DEPTH',
      name: 'bibleDepth',
      desc: '',
      args: [],
    );
  }

  /// `STRAR THE DIVE`
  String get startTheDive {
    return Intl.message(
      'STRAR THE DIVE',
      name: 'startTheDive',
      desc: '',
      args: [],
    );
  }

  /// `MY ANALYSIS`
  String get myAnalysis {
    return Intl.message(
      'MY ANALYSIS',
      name: 'myAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `У тебя ещё нет разборов`
  String get emptyFolder {
    return Intl.message(
      'У тебя ещё нет разборов',
      name: 'emptyFolder',
      desc: '',
      args: [],
    );
  }

  /// `+Добавить разбор`
  String get addAnalysis {
    return Intl.message(
      '+Добавить разбор',
      name: 'addAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `ВЫБЕРИТЕ КНИГУ БИБЛИИ`
  String get choiceBook {
    return Intl.message(
      'ВЫБЕРИТЕ КНИГУ БИБЛИИ',
      name: 'choiceBook',
      desc: '',
      args: [],
    );
  }

  /// `Выберите отрывок для изучения`
  String get selectAnExcerptToStudy {
    return Intl.message(
      'Выберите отрывок для изучения',
      name: 'selectAnExcerptToStudy',
      desc: '',
      args: [],
    );
  }

  /// `Глава {number}`
  String numberChapter(Object number) {
    return Intl.message(
      'Глава $number',
      name: 'numberChapter',
      desc: '',
      args: [number],
    );
  }

  /// `Создать`
  String get create {
    return Intl.message(
      'Создать',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Выберите папку`
  String get selectFolder {
    return Intl.message(
      'Выберите папку',
      name: 'selectFolder',
      desc: '',
      args: [],
    );
  }

  /// `У вас пока нет папок с разборами, создайте новую`
  String get haveNotFolders {
    return Intl.message(
      'У вас пока нет папок с разборами, создайте новую',
      name: 'haveNotFolders',
      desc: '',
      args: [],
    );
  }

  /// `Создать новую папку`
  String get createNewFolder {
    return Intl.message(
      'Создать новую папку',
      name: 'createNewFolder',
      desc: '',
      args: [],
    );
  }

  /// `Отменить`
  String get cancel {
    return Intl.message(
      'Отменить',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `добавить`
  String get add {
    return Intl.message(
      'добавить',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get name {
    return Intl.message(
      'Название',
      name: 'name',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
