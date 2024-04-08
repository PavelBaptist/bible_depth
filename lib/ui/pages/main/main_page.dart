import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:bible_depth/core/version_handler.dart';
import 'package:bible_depth/helpers/dialogs.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:bible_depth/ui/svg/svgs.dart';
import 'package:bible_depth/ui/widgets/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:translit/translit.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController c = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    ThemeData style = Theme.of(context);

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
                      extentRatio: 0.3,
                      children: [
                        Expanded(
                          child: Container(
                            child: Align(
                              child: IconButton(
                                icon: const Icon(Icons.ios_share),
                                onPressed: () async {
                                  String path =
                                      '${(await getApplicationDocumentsDirectory()).path}/shared/';
                                  Directory directory = Directory(path);

                                  if (!directory.existsSync()) {
                                    directory.createSync(recursive: true);
                                  }

                                  String filePath =
                                      '$path/${Translit().toTranslit(source: fragment.name)}.bibledepth';
                                  try {
                                    File file = File(filePath);
                                    await file.writeAsBytes(Uint8List.fromList(
                                        fragment
                                            .toJson()
                                            .toString()
                                            .codeUnits));
                                    print(
                                        'Файл сохранен успешно по пути: $filePath');
                                  } catch (e) {
                                    print(
                                        'Произошла ошибка при сохранении файла: $e');
                                  }

                                  Share.shareFiles([filePath]);
                                },
                              ),
                            ),
                          ),
                        ),
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

            result.add(
              FutureBuilder(
                future: VersionHandler.getVersionFromPubspec(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'version: ${snapshot.data} | version from db: ${VersionHandler.getVersionFromDB()}',
                          style: style.textTheme.bodySmall,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            );
            return result;
          }(),
        );
      }),
    );
  }
}
