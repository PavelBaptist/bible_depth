import 'package:flutter/material.dart';

class BlockWidget extends StatelessWidget {
  String header;
  Widget child;
  List<Widget>? actions;

  BlockWidget({
    super.key,
    required this.child,
    required this.header,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData style = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 63.85,
          color: style.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    header,
                    style: style.textTheme.titleMedium?.copyWith(
                      color: style.colorScheme.inversePrimary,
                    ),
                  ),
                ),
                ...?actions,
              ],
            ),
          ),
        ),
        const SizedBox(height: 13),
        child,
        const SizedBox(height: 16),
      ],
    );
  }
}
