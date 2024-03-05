import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/controller.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/word_widget.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsWidget extends StatelessWidget {
  ResultsWidget({super.key});

  final FragmentPageController c = Get.find();
  final MainPageController mainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: () {
            Word emptyWord = Word();
            List<Widget> results = [];

            Map<String, List<Widget>> map = {};
            for (var wrapEntity in c.fragment.value.text) {
              if (wrapEntity is! Word ||
                  wrapEntity.styleId == '' ||
                  wrapEntity.styleMatches(emptyWord)) {
                continue;
              }

              if (map[wrapEntity.styleId] == null) {
                map[wrapEntity.styleId] = <Widget>[];
              }
              map[wrapEntity.styleId]!.add(WordWidget(
                wrapEntity,
                wordStyleList: mainPageController.wordStyleList!.value,
              ));
            }

            List<List<Widget>> list = [];

            map.forEach(
              (key, value) {
                list.add(value);
              },
            );

            list.sort(
              (a, b) {
                return b.length - a.length;
              },
            );

            for (var value in list) {
              value.insert(0, Text(value.length.toString() + ' повтор.: '));
              results.add(
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Wrap(
                    spacing: c.fontSize.value / 4,
                    runSpacing: c.fontSize.value / 4,
                    children: value,
                  ),
                ),
              );
            }

            return results;
          }(),
        ),
      ),
    );
  }
}
