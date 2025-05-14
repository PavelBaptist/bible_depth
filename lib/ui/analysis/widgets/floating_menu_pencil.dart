import 'package:bible_depth/library.dart';

class FloatingMenuPencil extends StatelessWidget {
  const FloatingMenuPencil({
    super.key,
    required this.onIncrease,
    required this.onReduce,
    required this.changeModeNewLine,
    required this.onEraser,
    required this.eraserMode,
  });

  final void Function() onReduce;
  final void Function() onIncrease;
  final void Function() changeModeNewLine;
  final void Function() onEraser;
  final bool eraserMode;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.bottomBar,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: SizedBox(
          height: 50,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                onTap: onIncrease,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: theme.backgroundPrimary,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: theme.textPrimary, width: 2)),
                  child: SvgPicture.asset(
                    AppIcons.increase,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onReduce,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: theme.backgroundPrimary,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: theme.textPrimary, width: 2)),
                  child: SvgPicture.asset(
                    AppIcons.reduce,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onEraser,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: theme.backgroundPrimary,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: theme.textPrimary, width: 2),
                    boxShadow: eraserMode
                        ? const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 8,
                              offset: Offset(0, 6),
                            ),
                          ]
                        : null,
                  ),
                  child: const Icon(Icons.close_rounded),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: changeModeNewLine,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: theme.backgroundPrimary,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: theme.textPrimary, width: 2)),
                  child: const Icon(Icons.wrap_text),
                ),
              )
            ],
          )),
    );
  }
}
