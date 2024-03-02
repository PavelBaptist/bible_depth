import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/fragment_list.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MainPageController extends GetxController {
  final _myBox = Hive.box('bible_depth');
  Rx<FragmentList>? fragmentList;
  Fragment? selectedFragment;
  MainPageController() {
    fragmentList = (_myBox.get('fragments') as FragmentList).obs;
  }
  updateDataBase() {
    if (fragmentList != null) {
      _myBox.put("fragments", fragmentList!.value);
    }
  }
}
