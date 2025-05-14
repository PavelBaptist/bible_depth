import 'package:bible_depth/library.dart';

class FloatingMenu extends StatelessWidget {
  const FloatingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 75,
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
    );
  }
}
