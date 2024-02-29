import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/data/bible/rst.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  Rx<Bible>? bible;

  Future<void> initBible() async {
    bible = (await Rst.instance).obs;
  }
}
