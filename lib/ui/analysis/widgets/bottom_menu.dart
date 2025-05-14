import 'package:bible_depth/library.dart';
import 'package:shared/shared.dart';

class CustomBottomMenu extends StatelessWidget {
  CustomBottomMenu(
      {super.key, required this.onTap, required this.selectedToolBar});

  final void Function(ToolsBar tool) onTap;
  final ToolsBar? selectedToolBar;
  final List<String> icons = [
    AppIcons.style,
    AppIcons.structural,
    AppIcons.comment,
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: 16,
        bottom: MediaQuery.of(context).viewPadding.bottom == 0
            ? 24
            : MediaQuery.of(context).viewPadding.bottom,
      ),
      decoration: BoxDecoration(
        color: theme.bottomBar,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              icons.length, (index) => _buildIconButton(index, theme))),
    );
  }

  Widget _buildIconButton(int index, UIThemes theme) {
    final ToolsBar toolBar = ToolsBar.values[index];
    return GestureDetector(
      onTap: () => onTap(toolBar),
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: selectedToolBar == toolBar ? theme.beruz : theme.lightBeruz,
          borderRadius: BorderRadius.circular(20),
          border: selectedToolBar == toolBar
              ? Border.all(color: theme.darkBeruz)
              : null,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: index == 4
              ? const Icon(Icons.mode_edit_outline)
              : index == 3
                  ? const Icon(Icons.subdirectory_arrow_left_sharp)
                  : SvgPicture.asset(
                      icons[index],
                      width: 24,
                      height: 24,
                    ),
        ),
      ),
    );
  }
}
