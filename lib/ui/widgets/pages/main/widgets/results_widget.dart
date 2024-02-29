import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:bible_depth/ui/widgets/pages/main/widgets/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsWidget extends StatelessWidget {
  ResultsWidget({super.key});

  final MainPageController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: () {
            Word emptyWord = Word(value: '');
            List<Widget> results = [];

            Map<String, List<Widget>> map = {};
            for (var wrapEntity in c.fragment.value.text) {
              if (wrapEntity is! Word || wrapEntity.styleMatches(emptyWord)) {
                continue;
              }
              String styleHash = wrapEntity.styleHash();
              if (map[styleHash] == null) {
                map[styleHash] = <Widget>[];
              }
              map[styleHash]!.add(WordWidget(wrapEntity));
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
