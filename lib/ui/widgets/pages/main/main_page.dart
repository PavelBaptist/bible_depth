import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController c = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('paint_test'),
            icon: const Icon(Icons.format_paint),
          ),
        ],
      ),
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
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(fragment.name),
                  onTap: () async {
                    c.selectedFragment = fragment;
                    await Get.toNamed('/fragment');
                    c.fragmentList!.update((val) {});
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
