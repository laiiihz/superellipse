/// SuperellipseRadius
///
///
class SuperellipseRadius {
  final SuperRadius topLeft;
  final SuperRadius topRight;
  final SuperRadius bottomLeft;
  final SuperRadius bottomRight;
  const SuperellipseRadius.all(SuperRadius radius)
      : this.topLeft = radius,
        this.topRight = radius,
        this.bottomLeft = radius,
        this.bottomRight = radius;
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
  const SuperRadius.value(double radius) : this.radius = radius;
  static const initial = SuperRadius.value(3);
  static const zero = SuperRadius.value(0);
}
