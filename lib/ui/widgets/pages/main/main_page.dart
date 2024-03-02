import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:bible_depth/ui/widgets/pages/new_fragment/new_fragment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController c = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed('new_fragment'),
      ),
      body: Obx(() {
        return ListView(
          children: () {
            List<Widget> result = [];
            c.fragmentList?.value.list.forEach((fragment) {
              result.add(InkWell(
                child: ListTile(
                  title: Text(fragment.name),
                  onTap: () {
                    c.selectedFragment = fragment;
                    Get.toNamed('/fragment');
                  },
                ),
              ));
            });
            return result;
          }(),
        );
      }),
    );
  }
}
