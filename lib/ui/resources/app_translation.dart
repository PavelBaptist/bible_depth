import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  static const locale = Locale('ru', 'RU');

  @override
  Map<String, Map<String, String>> get keys => {
        'ru_RU': {
          'error': 'Ошибка',
          'cancel': 'Отмена',
          'my_fragments': 'МОИ РАЗБОРЫ',
        }
      };
}
