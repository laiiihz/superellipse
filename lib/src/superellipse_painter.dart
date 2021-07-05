import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:superellipse/src/superellipse_path.dart';
import 'package:superellipse/src/superellipse_radius.dart';

///SuperellipsePainter
///
///the `n` must bigger than `0`
///
///too big `n` may cause performance issue
///
///example
///```dart
/// CustomPaint(
///   painter: SuperellipsePainter(),
///   size: Size(100, 100),
///)
///```
class SuperellipsePainter extends CustomPainter {
  final SuperellipseRadius radius;
  final Paint? displayPaint;
  SuperellipsePainter({
    this.radius = SuperellipseRadius.initial,
    this.displayPaint,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = displayPaint ?? Paint()
      ..color = Colors.orange;
    canvas.drawPath(
      superellipsePath(
        Rect.fromLTWH(0, 0, size.width, size.height),
        radius: radius,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(SuperellipsePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SuperellipsePainter oldDelegate) => false;
}
