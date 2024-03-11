import 'package:flutter/material.dart';

import 'svg.dart';

/// Data of a SVG to display in [SvgImage].
class SvgData {
  const SvgData(
    this.asset, {
    this.width,
    this.height,
  });

  /// Asset of the SVG.
  final String asset;

  /// Width of the SVG.
  final double? width;

  /// Height of the SVG.
  final double? height;
}

/// [SvgImage.icon] wrapper.
class SvgIcon extends StatelessWidget {
  const SvgIcon(this.data, {super.key, this.width, this.height});

  /// [SvgData] to pass to the [SvgImage].
  final SvgData data;

  /// Optional width to display [data] of.
  final double? width;

  /// Optional height to display [data] of.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgImage.icon(data, width: width, height: height);
  }
}

/// [SvgData]s of the SVG icons available.
class SvgIcons {
  static const SvgData settings = SvgData(
    'assets/icons/settings.svg',
    width: 30.64,
    height: 30.64,
  );
}
