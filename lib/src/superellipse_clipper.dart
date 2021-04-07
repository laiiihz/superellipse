import 'package:flutter/widgets.dart';
import 'package:superellipse/superellipse.dart';

///```dart
/// ClipPath(
///   child: child,
///   clipper: SuperellipseClipper(),
/// ),
///```
class SuperellipseClipper extends CustomClipper<Path> {
  final SuperellipseRadius radius;

  SuperellipseClipper({this.radius = SuperellipseRadius.initial});

  @override
  Path getClip(Size size) {
    return superellipsePath(
      Rect.fromLTWH(0, 0, size.width, size.height),
      radius: radius,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
