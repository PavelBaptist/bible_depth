import 'dart:convert';

import 'package:bible_depth/library.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/word_widget.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:finger_painter/finger_painter.dart';
import 'dart:ui' as ui;

class WordStyleEditorPage extends StatelessWidget {
  WordStyleEditorPage({super.key});
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
  Color paintColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    descriptionController.text = (c.currentTool.value as WordStyle).description;
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WordWidget(
                Word()
                  ..value = 'образец'
                  ..styleId = (c.currentTool.value as WordStyle).id,
                fontSize: 50.sp,
              ),
              TextField(
                controller: descriptionController,
                onChanged: (String value) {
                  (c.currentTool.value as WordStyle).description = value;
                  update();
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      'Жирный',
                      style: style.bodyMedium,
                    ),
                    Checkbox(
                      value: (c.currentTool.value as WordStyle).isBold,
                      onChanged: (value) {
                        (c.currentTool.value as WordStyle).isBold = value;
                        update();
                      },
                    ),
                    SizedBox(width: 25.w),
                    Text(
                      'Наклоненный',
                      style: style.bodyMedium,
                    ),
                    Checkbox(
                      value: (c.currentTool.value as WordStyle).isItalic,
                      onChanged: (value) {
                        (c.currentTool.value as WordStyle).isItalic = value;
                        update();
                      },
                    ),
                    SizedBox(width: 25.w),
                    Text(
                      'Обводка кругом',
                      style: style.bodyMedium,
                    ),
                    Checkbox(
                      value: (c.currentTool.value as WordStyle).borderIsCircle,
                      onChanged: (value) {
                        (c.currentTool.value as WordStyle).borderIsCircle =
                            value ?? false;
                        update();
                      },
                    ),
                  ],
                ),
              ),
              ColorPicker(
                label: 'Цвет текста',
                onTap: (color) {
                  (c.currentTool.value as WordStyle).fontColor = color;
                  update();
                },
                selectedLogic: (color) =>
                    (c.currentTool.value as WordStyle).fontColor == color,
              ),
              ColorPicker(
                label: 'Цвет фона',
                onTap: (color) {
                  (c.currentTool.value as WordStyle).highlightColor = color;
                  update();
                },
                selectedLogic: (color) =>
                    (c.currentTool.value as WordStyle).highlightColor == color,
              ),
              ColorPicker(
                label: 'Цвет обводки',
                onTap: (color) {
                  (c.currentTool.value as WordStyle).borderColor = color;
                  update();
                },
                selectedLogic: (color) =>
                    (c.currentTool.value as WordStyle).borderColor == color,
              ),
              Painter(
                controller: painterController,
                backgroundColor: Colors.black.withAlpha(30),
                onDrawingEnded: (bytes) async {
                  if (bytes != null) {
                    String base64Data = base64Encode(bytes);
                    (c.currentTool.value as WordStyle).image = base64Data;
                    update();
                  }
                },
                size: const Size(230, 80),
                // child: Image.asset('assets/map.png', fit: BoxFit.cover),
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
                    (c.currentTool.value as WordStyle).image = null;
                    update();
                  },
                  icon: const Icon(Icons.clear)),
              SizedBox(width: 25.sp),
              Text(
                'Растягивать картинку',
                style: style.bodyMedium,
              ),
              Checkbox(
                value: (c.currentTool.value as WordStyle).stretchImage,
                onChanged: (value) {
                  (c.currentTool.value as WordStyle).stretchImage =
                      value ?? false;

                  update();
                },
              ),
            ],
          ),
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
