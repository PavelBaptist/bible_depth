import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 63.85.h,
          color: style.colorScheme.primary,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
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
        SizedBox(height: 13.h),
        child,
        SizedBox(height: 16.h),
      ],
    );
  }
}
