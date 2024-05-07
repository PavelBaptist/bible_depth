import 'dart:io';
import 'dart:typed_data';

import 'package:bible_depth/helpers/dialogs.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/fragment_list.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:translit/translit.dart';

class MainPageController extends GetxController {
  final _myBox = Hive.box('bible_depth');
  Rx<FragmentList>? fragmentList;

  Fragment? selectedFragment;

  MainPageController() {
    fragmentList = (_myBox.get('fragments') as FragmentList).obs;
  }
  updateDataBaseFragments() {
    if (fragmentList != null) {
      _myBox.put("fragments", fragmentList!.value);
    }
  }

  toFragment(Fragment fragment) async {
    selectedFragment = fragment;
    await Get.toNamed('/fragment');
    fragmentList!.update((val) {});
  }

  share(Fragment fragment) async {
    String path = '${(await getApplicationDocumentsDirectory()).path}/shared/';
    Directory directory = Directory(path);

    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    String filePath =
        '$path/${Translit().toTranslit(source: fragment.name)}.bibledepth';
    try {
      File file = File(filePath);
      await file.writeAsBytes(
          Uint8List.fromList(fragment.toJson().toString().codeUnits));
      print('Файл сохранен успешно по пути: $filePath');
    } catch (e) {
      print('Произошла ошибка при сохранении файла: $e');
    }

    Share.shareFiles([filePath]);
  }

  delete(Fragment fragment) async {
    showConfirmationDialog(Get.context!, onTapYes: () {
      fragmentList?.value.list.remove(fragment);
      updateDataBaseFragments();
      fragmentList?.update((val) {});
    }, text: fragment.name, titleText: 'Удалить?');
  }
}
