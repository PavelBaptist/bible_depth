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
  static const SvgData delete = SvgData(
    'assets/icons/delete.svg',
  );
  static const SvgData arrowLeft = SvgData(
    'assets/icons/arrow_left.svg',
  );
  static const SvgData arrowRightGrey = SvgData(
    'assets/icons/arrow_right_grey.svg',
  );
  static const SvgData arrowRightWhite = SvgData(
    'assets/icons/arrow_right_white.svg',
  );
  static const SvgData closeLight = SvgData(
    'assets/icons/close_light.svg',
  );
  static const SvgData closeDark = SvgData(
    'assets/icons/close_dark.svg',
  );
  static const SvgData addGrey = SvgData(
    'assets/icons/add_grey.svg',
  );
  static const SvgData zoomPlus = SvgData(
    'assets/icons/zoom_plus.svg',
  );
  static const SvgData zoomMinus = SvgData(
    'assets/icons/zoom_minus.svg',
  );
  static const SvgData undo = SvgData(
    'assets/icons/undo.svg',
  );
  static const SvgData undoDisabled = SvgData(
    'assets/icons/undo_disabled.svg',
  );
  static const SvgData redo = SvgData(
    'assets/icons/redo.svg',
  );
  static const SvgData redoDisabled = SvgData(
    'assets/icons/redo_disabled.svg',
  );
}
