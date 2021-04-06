import 'dart:ui';
import 'dart:math' as math;

/// example:
///
/// ```dart
/// Path path = superellipsePath( Rect.fromLTWH(0,0,10,10), n: 3);
/// ```
///
Path superellipsePath(Rect rect, {double n = 3}) {
  final double width = rect.width / 2;
  final double height = rect.height / 2;
  Path path = Path();
  path.moveTo(0, height);
  for (double i = -width; i <= width; i += 1) {
    double x = i + width;
    double y = math.pow(1 - math.pow((i / width).abs(), n), 1 / n) * height;
    y = y + height;
    path.lineTo(x, y);
  }
  for (double i = width; i >= -width; i -= 1) {
    double x = i + width;
    double y = -math.pow(1 - math.pow((i / width).abs(), n), 1 / n) * height;
    y = y + height;
    path.lineTo(x, y);
  }
  return path;
}
