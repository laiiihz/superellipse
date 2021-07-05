/// SuperellipseRadius
///
///
class SuperellipseRadius {
  final SuperRadius topLeft;
  final SuperRadius topRight;
  final SuperRadius bottomLeft;
  final SuperRadius bottomRight;
  const SuperellipseRadius.all(SuperRadius radius)
      : topLeft = radius,
        topRight = radius,
        bottomLeft = radius,
        bottomRight = radius;
  const SuperellipseRadius.only({
    this.topLeft = SuperRadius.zero,
    this.topRight = SuperRadius.zero,
    this.bottomLeft = SuperRadius.zero,
    this.bottomRight = SuperRadius.zero,
  });

  static const initial = SuperellipseRadius.all(SuperRadius.initial);
}

/// SuperRadius
class SuperRadius {
  final double radius;
  const SuperRadius.value(this.radius);
  static const initial = SuperRadius.value(3);
  static const zero = SuperRadius.value(0);
}
