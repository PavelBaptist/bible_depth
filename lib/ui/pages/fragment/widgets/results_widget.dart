import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/structural_law_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/word_widget.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsWidget extends StatelessWidget {
  ResultsWidget({super.key});

  final FragmentPageController c = Get.find();
  final MainPageController mainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    ThemeData style = Theme.of(context);

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: () {
          Word emptyWord = Word();
          List<Widget> results = [];

          // итоги повторяющихся слов
          Map<String, List<Widget>> wordsGroup = {};

          for (var wrapEntity in c.fragment.value.text) {
            if (wrapEntity is! Word ||
                wrapEntity.styleId == '' ||
                wrapEntity.styleMatches(emptyWord)) {
              continue;
            }

            if (wordsGroup[wrapEntity.styleId] == null) {
              wordsGroup[wrapEntity.styleId] = <Widget>[];
            }
            wordsGroup[wrapEntity.styleId]!.add(WordWidget(wrapEntity));
          }

          if (wordsGroup.isNotEmpty) {
            results.add(
              Text(
                'Повторяющиеся слова:',
                style: style.textTheme.titleSmall?.copyWith(
                  color: Colors.black,
                ),
              ),
            );
          }

          List<List<Widget>> list = [];

          wordsGroup.forEach(
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

          // итоги структурных законов
          Map<String, List<Widget>> structuredLawsGroup = {};

          for (var wrapEntity in c.fragment.value.text) {
            String structuralLawId = '';
            if (wrapEntity is Word && wrapEntity.structuralLawId != '') {
              structuralLawId = wrapEntity.structuralLawId;
            } else if (wrapEntity is StructuralLawPlace &&
                wrapEntity.structuralLawId != '') {
              structuralLawId = wrapEntity.structuralLawId;
            } else {
              continue;
            }

            if (structuredLawsGroup[structuralLawId] == null) {
              structuredLawsGroup[structuralLawId] = <Widget>[];
            }
            structuredLawsGroup[structuralLawId]!
                .add(StructuralLawWidget(structuralLawId));
          }
          results.add(const SizedBox(height: 16));

          if (structuredLawsGroup.isNotEmpty) {
            results.add(
              Text(
                'Повторяющиеся структурные законы:',
                style: style.textTheme.titleSmall?.copyWith(
                  color: Colors.black,
                ),
              ),
            );
          }

          List<List<Widget>> listStructuredLaws = [];

          structuredLawsGroup.forEach(
            (key, value) {
              listStructuredLaws.add(value);
            },
          );

          listStructuredLaws.sort(
            (a, b) {
              return b.length - a.length;
            },
          );

          for (var value in listStructuredLaws) {
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
    );
  }
}
