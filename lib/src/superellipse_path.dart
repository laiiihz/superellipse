import 'dart:ui';
import 'dart:math' as math;

import 'package:superellipse/src/superellipse_radius.dart';

/// example:
///
/// ```dart
/// Path path = superellipsePath( Rect.fromLTWH(0,0,10,10));
/// ```
///
Path superellipsePath(
  Rect rect, {
  SuperellipseRadius radius = SuperellipseRadius.initial,
}) {
  final double bottomLeftN = radius.bottomLeft.radius;
  final double bottomRightN = radius.bottomRight.radius;
  final double topLeftN = radius.topLeft.radius;
  final double topRightN = radius.topRight.radius;

  final double width = rect.width / 2;
  final double height = rect.height / 2;
  Path path = Path();
  path.moveTo(0, height);

  //bottom Left
  _renderBottomLeft() {
    for (double i = -width; i <= 0; i += 1) {
      double x = i + width;
      double y = math.pow(
              1 - math.pow((i / width).abs(), bottomLeftN), 1 / bottomLeftN) *
          height;
      y = y + height;
      path.lineTo(x, y);
    }
  }

  _renderBottomLeftLine() {
    path.lineTo(0, height * 2);
  }

  //bottom right
  _renderBottomRight() {
    for (double i = 0; i <= width; i += 1) {
      double x = i + width;
      double y = math.pow(
              1 - math.pow((i / width).abs(), bottomRightN), 1 / bottomRightN) *
          height;
      y = y + height;
      path.lineTo(x, y);
    }
  }

  _renderBottomRightLine() {
    path.lineTo(width * 2, height * 2);
  }

  //top right
  _renderTopRight() {
    for (double i = width; i >= 0; i -= 1) {
      double x = i + width;
      double y =
          -math.pow(1 - math.pow((i / width).abs(), topRightN), 1 / topRightN) *
              height;
      y = y + height;
      path.lineTo(x, y);
    }
  }

  _renderTopRightLine() {
    path.lineTo(width * 2, 0);
  }

  //top Left
  _renderTopLeft() {
    for (double i = 0; i >= -width; i -= 1) {
      double x = i + width;
      double y =
          -math.pow(1 - math.pow((i / width).abs(), topLeftN), 1 / topLeftN) *
              height;
      y = y + height;
      path.lineTo(x, y);
    }
  }

  _renderTopLeftLine() {
    path.lineTo(0, 0);
  }

  bottomLeftN != 0 ? _renderBottomLeft() : _renderBottomLeftLine();
  bottomRightN != 0 ? _renderBottomRight() : _renderBottomRightLine();
  topRightN != 0 ? _renderTopRight() : _renderTopRightLine();
  topLeftN != 0 ? _renderTopLeft() : _renderTopLeftLine();

  return path;
}
