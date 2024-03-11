import 'dart:io';
import 'dart:ui' as ui;

import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveUint8ListAsPng(Uint8List data, String fileName) async {
  String path =
      '${(await getApplicationDocumentsDirectory()).path}/userLables/';
  Directory directory = Directory(path);

  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

  String filePath = '$path/$fileName';
  try {
    File file = File(filePath);
    await file.writeAsBytes(data);
    print('Файл сохранен успешно по пути: $filePath');
  } catch (e) {
    print('Произошла ошибка при сохранении файла: $e');
  }
}

class PaintTest extends StatefulWidget {
  const PaintTest({Key? key}) : super(key: key);

  @override
  State<PaintTest> createState() => _PaintTestState();
}

class _PaintTestState extends State<PaintTest> {
  Image? image;
  late PainterController painterController;

  @override
  void initState() {
    super.initState();
    painterController = PainterController()
      ..setStrokeColor(Colors.black)
      ..setMinStrokeWidth(3)
      ..setMaxStrokeWidth(15)
      ..setBlurSigma(0.0)
      ..setPenType(PenType.paintbrush2)
      ..setBlendMode(ui.BlendMode.srcOver);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                saveUint8ListAsPng(
                    painterController.getImageBytes()!, 'test.png');
              },
              child: Text('test')),
          const SizedBox(height: 30),
          Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 160,
                  height: 60,
                  child: Center(
                    child: Text(
                      'образец',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              Center(
                child: Painter(
                  controller: painterController,
                  backgroundColor: Colors.black.withAlpha(30),
                  onDrawingEnded: (bytes) async {
                    print(
                        '${painterController.getPoints()?.length} drawn points');
                    setState(() {});
                  },
                  size: const Size(160, 60),
                  // child: Image.asset('assets/map.png', fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
                child: Controls(
              pc: painterController,
              imgBytesList: painterController.getImageBytes(),
            )),
          ),
        ],
      ),
    );
  }
}

class Controls extends StatefulWidget {
  final PainterController? pc;
  final Uint8List? imgBytesList;

  const Controls({
    Key? key,
    this.pc,
    this.imgBytesList,
  }) : super(key: key);

  @override
  State<Controls> createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text('русской синодальной библии',
                    style: TextStyle(fontSize: 30)),
                if (widget.imgBytesList != null)
                  Image.memory(
                    widget.imgBytesList!,
                    gaplessPlayback: true,
                    fit: BoxFit.scaleDown,
                  ),
              ],
            ),

            const SizedBox(width: 30),

            // Pen types
            Column(
              children: [
                for (int i = 0; i < PenType.values.length; i++)
                  OutlinedButton(
                      child: Text(PenType.values[i].name),
                      style: ButtonStyle(
                          backgroundColor: widget.pc
                                      ?.getState()
                                      ?.penType
                                      .index ==
                                  i
                              ? MaterialStateProperty.all(
                                  Colors.greenAccent.withOpacity(0.5))
                              : MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {
                        if (widget.pc != null) {
                          widget.pc!.setPenType(PenType.values[i]);
                          setState(() {});
                        }
                      }),
              ],
            ),
          ],
        ),

        const SizedBox(height: 30),

        // Colors, background & delete
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () => widget.pc?.setStrokeColor(Colors.red)),
            FloatingActionButton(
                backgroundColor: Colors.yellowAccent,
                onPressed: () =>
                    widget.pc?.setStrokeColor(Colors.yellowAccent)),
            FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () => widget.pc?.setStrokeColor(Colors.black)),
            FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () => widget.pc?.setStrokeColor(Colors.green)),
            FloatingActionButton(
                backgroundColor: Colors.blue,
                child: const Icon(Icons.image),
                onPressed: () async {
                  Uint8List image = (await rootBundle.load('assets/dash.png'))
                      .buffer
                      .asUint8List();
                  widget.pc?.setBackgroundImage(image);
                  setState(() {});
                }),
            FloatingActionButton(
                backgroundColor: Colors.red,
                child: const Icon(Icons.delete_outline),
                onPressed: () => widget.pc
                    ?.clearContent(clearColor: const Color(0xfff0f0ff))),
          ],
        ),

        const SizedBox(height: 30),

        /// min stroke width
        Row(
          children: [
            Text('  min stroke '
                '${widget.pc?.getState()!.strokeMinWidth.toStringAsFixed(1)}'),
            Expanded(
              child: Slider.adaptive(
                  value: widget.pc?.getState()?.strokeMinWidth ?? 0,
                  min: 1,
                  max: 20,
                  onChanged: (value) {
                    if (widget.pc != null) {
                      widget.pc?.setMinStrokeWidth(value);
                      if (widget.pc!.getState()!.strokeMinWidth >
                          widget.pc!.getState()!.strokeMaxWidth) {
                        widget.pc?.setMinStrokeWidth(
                            widget.pc!.getState()!.strokeMaxWidth);
                      }
                      setState(() {});
                    }
                  }),
            ),
          ],
        ),

        /// max stroke width
        Row(
          children: [
            Text('  max stroke '
                '${widget.pc?.getState()!.strokeMaxWidth.toStringAsFixed(1)}'),
            Expanded(
              child: Slider.adaptive(
                  value: widget.pc?.getState()?.strokeMaxWidth ?? 0,
                  min: 1,
                  max: 40,
                  onChanged: (value) {
                    if (widget.pc != null) {
                      widget.pc!.setMaxStrokeWidth(value);
                      if (widget.pc!.getState()!.strokeMaxWidth <
                          widget.pc!.getState()!.strokeMinWidth) {
                        widget.pc!.setMaxStrokeWidth(
                            widget.pc!.getState()!.strokeMinWidth);
                      }
                      setState(() {});
                    }
                  }),
            ),
          ],
        ),

        /// blur
        Row(
          children: [
            Text('  blur '
                '${widget.pc?.getState()!.blurSigma.toStringAsFixed(1)}'),
            Expanded(
              child: Slider.adaptive(
                  value: widget.pc?.getState()?.blurSigma ?? 0,
                  min: 0.0,
                  max: 10.0,
                  onChanged: (value) {
                    if (widget.pc != null) {
                      widget.pc!.setBlurSigma(value);
                      setState(() {});
                    }
                  }),
            ),
          ],
        ),

        const SizedBox(height: 30),

        // blends modes
        Wrap(
          spacing: 4,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(' blend modes: '),
            for (int i = 0; i < ui.BlendMode.values.length; i++)
              OutlinedButton(
                  child: Text(ui.BlendMode.values[i].name),
                  style: ButtonStyle(
                      backgroundColor:
                          widget.pc?.getState()?.blendMode.index == i
                              ? MaterialStateProperty.all(
                                  Colors.greenAccent.withOpacity(0.5))
                              : MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () {
                    widget.pc?.setBlendMode(ui.BlendMode.values[i]);
                    setState(() {});
                  }),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
