import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/header_widget.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderEditorPage extends StatelessWidget {
  late Header header;
  late int level;
  TextEditingController textController = TextEditingController();

  final FragmentPageController fragmentPageController = Get.find();
  final MainPageController mainPageController = Get.find();

  HeaderEditorPage({super.key}) {
    Map<String, dynamic> args = Get.arguments;
    header = args['header'] as Header;
    textController.text = header.value;
    level = header.level;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              header.value = textController.text.trim();
              header.level = level;

              mainPageController.updateDataBaseFragments();
              fragmentPageController.fragment.update((val) {});

              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
          ),
          MyRadioGroup(
            value: level,
            onChange: (value) => level = value ?? level,
          ),
        ],
      ),
    );
  }
}

class MyRadioGroup extends StatefulWidget {
  void Function(int? value) onChange;
  int value;
  MyRadioGroup({required this.value, required this.onChange});
  @override
  _MyRadioGroupState createState() => _MyRadioGroupState();
}

class _MyRadioGroupState extends State<MyRadioGroup> {
  int? _selectedValue = 0;

  @override
  void initState() {
    _selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          title: HeaderWidget(
            Header()
              ..value = 'Уровень заголовка 1'
              ..level = 1,
            usePadding: false,
          ),
          value: 1,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
              widget.onChange(value);
            });
          },
        ),
        RadioListTile(
          title: HeaderWidget(
            Header()
              ..value = 'Уровень заголовка 2'
              ..level = 2,
            usePadding: false,
          ),
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
              widget.onChange(value);
            });
          },
        ),
        RadioListTile(
          title: HeaderWidget(
            Header()
              ..value = 'Уровень заголовка 3'
              ..level = 3,
            usePadding: false,
          ),
          value: 3,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
              widget.onChange(value);
            });
          },
        ),
        RadioListTile(
          title: HeaderWidget(
            Header()
              ..value = 'Уровень заголовка 4'
              ..level = 4,
            usePadding: false,
          ),
          value: 4,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
              widget.onChange(value);
            });
          },
        ),
        RadioListTile(
          title: HeaderWidget(
            Header()
              ..value = 'Уровень заголовка 5'
              ..level = 5,
            usePadding: false,
          ),
          value: 5,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
              widget.onChange(value);
            });
          },
        ),
        RadioListTile(
          title: HeaderWidget(
            Header()
              ..value = 'Уровень заголовка 6'
              ..level = 6,
            usePadding: false,
          ),
          value: 6,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
              widget.onChange(value);
            });
          },
        ),
      ],
    );
  }
}
