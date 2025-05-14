import 'dart:io';

import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';

class FloatingMenuStyles extends StatefulWidget {
  const FloatingMenuStyles({
    super.key,
    required this.styles,
    required this.onSelectedStyle,
    required this.selectedStyle,
    required this.create,
    required this.onReorder,
    required this.delete,
  });

  final List<WordStyle> styles;
  final WordStyle? selectedStyle;
  final void Function(WordStyle style) onSelectedStyle;
  final void Function(WordStyle style) create;
  final void Function(int oldIndex, int newIndex) onReorder;
  final void Function(WordStyle style) delete;

  @override
  State<FloatingMenuStyles> createState() => _FloatingMenuStylesState();
}

class _FloatingMenuStylesState extends State<FloatingMenuStyles> {
  bool deleteMode = false;
  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () => setState(() {
        deleteMode = false;
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
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
          height: 78,
          child: ReorderableListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            onReorderStart: (index) async {
              if (index != 0) {
                if (Platform.isIOS) {
                  await HapticFeedback.lightImpact();
                } else if (Platform.isAndroid) {
                  if (await Vibration.hasVibrator()) {
                    Vibration.vibrate(duration: 50);
                  }
                }
                setState(() {
                  deleteMode = true;
                });
              }
            },
            onReorder: (oldIndex, newIndex) async {
              if (oldIndex != 0) {
                if (Platform.isIOS) {
                  HapticFeedback.lightImpact();
                } else if (Platform.isAndroid) {
                  if (await Vibration.hasVibrator()) {
                    Vibration.vibrate(duration: 50);
                  }
                }
                widget.onReorder(oldIndex, newIndex);
              }
            },
            proxyDecorator: (child, index, animation) {
              return Material(
                type: MaterialType.transparency,
                elevation: 6,
                shadowColor: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  transform: Matrix4.translationValues(0, -8, 0),
                  child: child,
                ),
              );
            },
            itemBuilder: (_, index) {
              if (index == 0) {
                return GestureDetector(
                  key: const Key('add style'),
                  onTap: () {
                    setState(() {
                      deleteMode = false;
                    });
                    showDialog(
                      context: context,
                      builder: (context) => CreateStyleWidget(
                        create: widget.create,
                      ),
                    );
                  },
                  onLongPress: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: theme.backgroundPrimary,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: theme.textPrimary, width: 2)),
                    child: SvgPicture.asset(
                      AppIcons.add,
                    ),
                  ),
                );
              } else {
                return Stack(
                  key: Key(widget.styles[index - 1].id.toString()),
                  children: [
                    StyleWidget(
                      style: widget.styles[index - 1],
                      selected:
                          widget.selectedStyle == widget.styles[index - 1],
                      onTap: () =>
                          widget.onSelectedStyle(widget.styles[index - 1]),
                    ),
                    if (deleteMode)
                      Positioned(
                        top: 8,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => Delete(
                                delete: () =>
                                    widget.delete(widget.styles[index - 1]),
                                style: widget.styles[index - 1],
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: theme.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              }
            },
            itemCount: widget.styles.length + 1,
          ),
        ),
      ),
    );
  }
}
