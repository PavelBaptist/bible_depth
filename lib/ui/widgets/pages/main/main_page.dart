import 'package:bible_depth/helpers/dialogs.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:bible_depth/ui/widgets/svg/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController c = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 65),
            child: Text('МОИ РАЗБОРЫ'),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () => Get.toNamed('paint_test'),
              icon: SvgIcon(SvgIcons.settings),
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
                    MyTile(fragment),
                    const SizedBox(height: 5.74),
                  ],
                ));
              });
              return result;
            }(),
          );
        }),
      ),
    );
  }
}

class MyTile extends StatefulWidget {
  Fragment fragment;
  MyTile(this.fragment, {super.key});

  @override
  State<MyTile> createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  final MainPageController c = Get.put(MainPageController());
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData style = Theme.of(context);
    return Slidable(
      key: Key(widget.fragment.hashCode.toString()),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.1,
        children: [
          Expanded(
            child: Container(
              child: Align(
                child: IconButton(
                  icon: const SvgIcon(SvgIcons.delete),
                  onPressed: () {
                    showConfirmationDialog(context, onTapYes: () {
                      c.fragmentList?.value.list.remove(widget.fragment);
                      c.updateDataBaseFragments();
                      c.fragmentList?.update((val) {});
                    }, text: widget.fragment.name, titleText: 'Удалить?');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      child: InkWell(
        onHover: (value) {
          selected = value;
          setState(() {});
        },
        canRequestFocus: true,
        onTap: () async {
          c.selectedFragment = widget.fragment;
          await Get.toNamed('/fragment');
          c.fragmentList!.update((val) {});
        },
        child: Container(
          color: selected
              ? style.colorScheme.primary
              : style.colorScheme.inversePrimary,
          height: 85,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
              Expanded(
                child: Text(
                  widget.fragment.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: selected
                            ? style.colorScheme.inversePrimary
                            : Colors.black,
                      ),
                ),
              ),
              SvgIcon(
                selected
                    ? SvgIcons.arrow_right_white
                    : SvgIcons.arrow_right_grey,
              ),
              const SizedBox(width: 33),
            ],
          ),
        ),
      ),
    );
  }
}
