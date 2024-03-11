import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

/// Instantiates a widget rendering an SVG picture from an [AssetBundle].
///
/// The key will be derived from the `assetName`, `package`, and `bundle`
/// arguments. The `package` argument must be non-`null` when displaying an SVG
/// from a package and `null` otherwise.
///
/// Either the [width] and [height] arguments should be specified, or the widget
/// should be placed in a context that sets tight layout constraints. Otherwise,
/// the image dimensions will change as the image is loaded, which will result
/// in ugly layout changes.
Widget svgFromAsset(
  String asset, {
  Alignment alignment = Alignment.center,
  bool excludeFromSemantics = false,
  BoxFit fit = BoxFit.contain,
  double? height,
  Key? key,
  String? package,
  WidgetBuilder? placeholderBuilder,
  String? semanticsLabel,
  double? width,
}) =>
    throw UnimplementedError();

/// Instantiates a widget rendering an SVG picture from an [Uint8List].
///
/// Either the [width] and [height] arguments should be specified, or the widget
/// should be placed in a context setting layout constraints tightly. Otherwise,
/// the image dimensions will change as the image is loaded, which will result
/// in ugly layout changes.
Widget svgFromBytes(
  Uint8List bytes, {
  Alignment alignment = Alignment.center,
  bool excludeFromSemantics = false,
  BoxFit fit = BoxFit.cover,
  double? height,
  Key? key,
  String? package,
  WidgetBuilder? placeholderBuilder,
  String? semanticsLabel,
  double? width,
}) =>
    throw UnimplementedError();

/// Instantiates a widget rendering an SVG picture from a [File].
///
/// Either the [width] and [height] arguments should be specified, or the widget
/// should be placed in a context setting layout constraints tightly. Otherwise,
/// the image dimensions will change as the image is loaded, which will result
/// in ugly layout changes.
Widget svgFromFile(
  File file, {
  Key? key,
  Alignment alignment = Alignment.center,
  bool excludeFromSemantics = false,
  BoxFit fit = BoxFit.cover,
  double? width,
  double? height,
  WidgetBuilder? placeholderBuilder,
  String? semanticsLabel,
}) =>
    throw UnimplementedError();
