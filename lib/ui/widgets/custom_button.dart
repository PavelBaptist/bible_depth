import 'package:bible_depth/library.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.infinity = true,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.shape,
    this.textStyle,
    this.side,
  });

  final void Function()? onPressed;
  final String title;
  final bool infinity;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final OutlinedBorder? shape;
  final TextStyle? textStyle;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    Widget button = OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          backgroundColor: backgroundColor ?? Colors.transparent,
          // disabledBackgroundColor: AppColors.redOpacity,
          foregroundColor: theme.textPrimary,
          disabledForegroundColor: const Color.fromRGBO(170, 171, 174, 1),
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
          side: onPressed == null
              ? null
              : side ?? BorderSide(color: theme.bordersPrimary),
        ),
        child: Text(
          title,
          style: textStyle ?? theme.jura700x16,
        ));
    return infinity
        ? Row(
            children: [
              Expanded(
                child: button,
              ),
            ],
          )
        : button;
  }
}
