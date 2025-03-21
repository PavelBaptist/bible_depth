import 'dart:convert';

import 'package:bible_depth/helpers/strings.dart';
import 'package:bible_depth/library.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/structural_law_widget.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:finger_painter/finger_painter.dart';
import 'dart:ui' as ui;

class StructuralLawEditorPage extends StatelessWidget {
  StructuralLawEditorPage({super.key});
  final FragmentPageController c = Get.find();
  final MainPageController mainPageController = Get.find();
  final TextEditingController descriptionController = TextEditingController();
  late PainterController painterController = PainterController()
    ..setStrokeColor(paintColor)
    ..setMinStrokeWidth(3)
    ..setMaxStrokeWidth(15)
    ..setBlurSigma(0.0)
    ..setPenType(PenType.paintbrush2)
    ..setBlendMode(ui.BlendMode.srcOver);
  Color paintColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    descriptionController.text =
        (c.currentTool.value as StructuralLaw).description;
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StructuralLawWidget(
              (c.currentTool.value as StructuralLaw).id,
              size: 64.sp,
            ),
            TextField(
              controller: descriptionController,
              onChanged: (String value) {
                (c.currentTool.value as StructuralLaw).description = value;

                update();
              },
            ),
            Painter(
              controller: painterController,
              backgroundColor: Colors.black.withAlpha(30),
              onDrawingEnded: (bytes) async {
                if (bytes != null) {
                  String base64Data = base64Encode(bytes);
                  (c.currentTool.value as StructuralLaw).image = base64Data;
                  (c.currentTool.value as StructuralLaw).isAssetsSource = false;

                  update();
                }
              },
              size: Size(64.sp, 64.sp),
            ),
            ColorPicker(
              label: 'Цвет чернил',
              onTap: (color) {
                painterController.setStrokeColor(color);
                paintColor = color;
              },
              selectedLogic: (color) => paintColor == color,
            ),
            IconButton(
                onPressed: () {
                  painterController.clearContent();
                  if (isGuid((c.currentTool.value as StructuralLaw).id)) {
                    (c.currentTool.value as StructuralLaw)
                        .copyProps(StructuralLaw());
                  } else {
                    (c.currentTool.value as StructuralLaw)
                        .copyProps(StructuralLaw.defaultSet.lastWhere(
                      (element) =>
                          element.id ==
                          (c.currentTool.value as StructuralLaw).id,
                    ));
                  }

                  update();
                },
                icon: const Icon(Icons.clear)),
            SizedBox(width: 25.w),
          ],
        );
      }),
    );
  }

  void update() {
    c.updateFragment();
    c.fragment.update((val) {});
    c.currentTool.update((val) {});
  }
}
