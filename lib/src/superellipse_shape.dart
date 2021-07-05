import 'package:flutter/widgets.dart';
import 'package:superellipse/src/superellipse_radius.dart';
import 'package:superellipse/superellipse.dart';

///example
///
///```dart
/// Material(
///   shape: SuperellipseShape(
///     side: BorderSide(
///       color: Colors.pink,
///       width: 4,
///     ),
///   ),
/// )
///```
///
class SuperellipseShape extends ShapeBorder {
  final BorderSide side;
  final SuperellipseRadius radius;

  const SuperellipseShape({
    this.side = BorderSide.none,
    this.radius = SuperellipseRadius.initial,
  });
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return superellipsePath(rect, radius: radius);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return superellipsePath(rect, radius: radius);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Path path = getOuterPath(rect);
    canvas.drawPath(path, side.toPaint());
  }

  @override
  ShapeBorder scale(double t) {
    return SuperellipseShape(
      side: side.scale(t),
      radius: radius,
    );
  }
}
