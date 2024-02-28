import 'package:bible_depth/ui/widgets/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  await GetStorage.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main',
      getPages: [
        GetPage(
          name: '/main',
          page: () => MainPage(),
        ),
      ],
    );
  }
}
