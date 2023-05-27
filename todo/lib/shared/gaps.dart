enum Gaps {
  extraSmall(2.0),
  smallest(4.0),
  small(8.0),
  medium(16.0),
  large(24.0),
  largest(36.0),
  extraLarge(48.0);

  const Gaps(this.value);

  final double value;
}
