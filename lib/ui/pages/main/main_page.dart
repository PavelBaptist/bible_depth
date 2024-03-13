import 'package:bible_depth/helpers/dialogs.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:bible_depth/ui/svg/svgs.dart';
import 'package:bible_depth/ui/widgets/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController c = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 65),
          child: Text('МОИ РАЗБОРЫ'),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('paint_test'),
            icon: const SvgIcon(SvgIcons.settings),
          ),
          const SizedBox(width: 50),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed('new_fragment'),
      ),
      body: Obx(() {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          children: () {
            List<Widget> result = [
              const SizedBox(height: 30),
            ];
            c.fragmentList?.value.list.forEach((fragment) {
              result.add(Column(
                children: [
                  MyTile(
                    key: Key(fragment.hashCode.toString()),
                    title: fragment.name,
                    onTap: () async {
                      c.selectedFragment = fragment;
                      await Get.toNamed('/fragment');
                      c.fragmentList!.update((val) {});
                    },
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.1,
                      children: [
                        Expanded(
                          child: Container(
                            child: Align(
                              child: IconButton(
                                icon: const SvgIcon(SvgIcons.delete),
                                onPressed: () {
                                  showConfirmationDialog(context, onTapYes: () {
                                    c.fragmentList?.value.list.remove(fragment);
                                    c.updateDataBaseFragments();
                                    c.fragmentList?.update((val) {});
                                  },
                                      text: fragment.name,
                                      titleText: 'Удалить?');
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.74),
                ],
              ));
            });
            return result;
          }(),
        );
      }),
    );
  }
}
