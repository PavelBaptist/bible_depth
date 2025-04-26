import 'package:bible_depth/library.dart';

class TwoButtons extends StatelessWidget {
  const TwoButtons({
    super.key,
    required this.secondTap,
    required this.oneButtonText,
    required this.twoButtonText,
    this.firstTap,
  });
  final void Function()? firstTap;
  final void Function()? secondTap;
  final String oneButtonText;
  final String twoButtonText;

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    // final appLocale = S.of(context);
    return Row(
      children: [
        _buttonClose(
          context: context,
          onPressed: firstTap ?? () => Navigator.of(context).pop(),
        ),
        const SizedBox(width: 16),
        _button(
          context: context,
          onPressed: secondTap,
        ),
      ],
    );
  }

  Widget _buttonClose({
    required BuildContext context,
    required void Function()? onPressed,
  }) {
    // final theme = UIThemes.of(context);
    return Expanded(
        child: CustomButton(
      onPressed: onPressed,
      title: oneButtonText,
      infinity: false,
    ));
  }

  Widget _button({
    required BuildContext context,
    required void Function()? onPressed,
  }) {
    // final theme = UIThemes.of(context);
    return Expanded(
        child: CustomButton(
      onPressed: onPressed,
      title: twoButtonText,
      infinity: false,
    ));
  }
}
