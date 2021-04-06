import 'package:flutter/widgets.dart';
import 'package:superellipse/superellipse.dart';

///example
///
///```dart
/// Material(
///   shape: SuperellipseShape(
///     n: 2,
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
  final double n;

  SuperellipseShape({
    this.side = BorderSide.none,
    this.n = 3,
  }) : assert(n >= 0);
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return superellipsePath(rect, n: n);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return superellipsePath(rect, n: n);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, side.toPaint());
  }

  @override
  ShapeBorder scale(double t) {
    return SuperellipseShape(
      side: side.scale(t),
      n: n,
    );
  }
}
