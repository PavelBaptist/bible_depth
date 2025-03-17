import 'package:bible_depth/library.dart';

class ColorPicker extends StatelessWidget {
  final List<Color> colors = [
    Colors.transparent,
    Colors.black,
    Colors.grey.shade500,
    Colors.white,
    Colors.red.shade900,
    Colors.red.shade500,
    Colors.red.shade200,
    Colors.orange.shade900,
    Colors.orange.shade500,
    Colors.orange.shade200,
    Colors.green.shade900,
    Colors.green.shade500,
    Colors.green.shade200,
    Colors.blue.shade900,
    Colors.blue.shade500,
    Colors.blue.shade200,
    Colors.deepPurple.shade900,
    Colors.deepPurple.shade500,
    Colors.deepPurple.shade200,
    Colors.yellow.shade900,
    Colors.yellow.shade500,
    Colors.yellow.shade200,
  ];

  String label;
  void Function(Color color) onTap;
  bool Function(Color color) selectedLogic;
  ColorPicker({
    super.key,
    required this.label,
    required this.onTap,
    required this.selectedLogic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        SizedBox(
          height: 38.sp,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
                onTap: () => onTap(colors[index]),
                child: Container(
                  margin: EdgeInsets.all(4.sp),
                  width: 30.sp,
                  height: 30.sp,
                  decoration: BoxDecoration(
                    color: colors[index],
                    border: Border.all(
                      color: Colors.black,
                      width: selectedLogic(colors[index]) ? 3 : 1,
                    ),
                  ),
                  child: colors[index] == Colors.transparent
                      ? const Center(child: Text('П'))
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
