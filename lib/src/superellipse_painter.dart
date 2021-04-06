import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:superellipse/src/superellipse_path.dart';

///SuperellipsePainter
///
///the `n` must bigger than `0`
///
///too big `n` may cause performance issue
///
///example
///```dart
/// CustomPaint(
///   painter: SuperellipsePainter(3),
///   size: Size(100, 100),
///)
///```
class SuperellipsePainter extends CustomPainter {
  final double n;
  final Paint displayPaint;
  SuperellipsePainter({this.n = 3, this.displayPaint})
      : assert(n > 0, 'n must bigger than 0');
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = displayPaint ?? Paint()
      ..color = Colors.orange;
    canvas.drawPath(
      superellipsePath(Rect.fromLTWH(0, 0, size.width, size.height), n: n),
      paint,
    );
  }

  @override
  bool shouldRepaint(SuperellipsePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SuperellipsePainter oldDelegate) => false;
}
