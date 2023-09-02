import 'dart:convert';

import 'package:bible_depth/feature/data/models/fragment_model.dart';

abstract class FragmentMockDataSource {
  Future<FragmentModel> getById(int id);
}

class FragmentMockDataSourceImpl implements FragmentMockDataSource {
  @override
  Future<FragmentModel> getById(int id) async {
    return FragmentModel.fromJson(json.decode(_jsonMock()));
  }

  String _jsonMock() {
    return '{"id":52,"name":"Первый фрагмент", "text":["В", "начале", "было", "Слово..."]}';
  }
}
