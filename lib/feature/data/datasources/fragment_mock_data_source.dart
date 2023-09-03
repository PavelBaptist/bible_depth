import 'dart:convert';

import 'package:bible_depth/feature/data/models/fragment_model.dart';

abstract class FragmentMockDataSource {
  Future<FragmentModel> getById(int id);
}

class FragmentMockDataSourceImpl implements FragmentMockDataSource {
  @override
  Future<FragmentModel> getById(int id) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return FragmentModel.fromJson(json.decode(_jsonMock()));
  }

  String _jsonMock() {
    return '''{ "id":52,
                "name":"Первый фрагмент", 
                "text":[
                  {"value": "В"},
                  {"value": "начале"},
                  {"value": "сотворил"},
                  {"value": "Бог"},
                  {"value": "небо"},
                  {"value": "и"},
                  {"value": "землю"},
                  {"value": "земля"},
                  {"value": "В"},
                  {"value": "начале"},
                  {"value": "сотворил"},
                  {"value": "Бог"},
                  {"value": "небо"},
                  {"value": "и"},
                  {"value": "землю"},
                  {"value": "земля"},
                  {"value": "В"},
                  {"value": "начале"},
                  {"value": "сотворил"},
                  {"value": "Бог"},
                  {"value": "небо"},
                  {"value": "и"},
                  {"value": "землю"},
                  {"value": "земля"},
                  {"value": "В"},
                  {"value": "начале"},
                  {"value": "сотворил"},
                  {"value": "Бог"},
                  {"value": "небо"},
                  {"value": "и"},
                  {"value": "землю"},
                  {"value": "земля"}
                ]}''';
  }
}
