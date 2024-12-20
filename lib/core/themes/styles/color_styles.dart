import 'package:flutter/material.dart';

class ColorStyles extends ThemeExtension<ColorStyles> {
  final Color? primaryBackground;
  final Color? primaryText;
  final Color? secondaryText;
  final Color? transparent;

  const ColorStyles({
    this.primaryBackground,
    this.primaryText,
    this.secondaryText,
    this.transparent,
  });

  @override
  ColorStyles copyWith({
    Color? primaryBackground,
    Color? primaryText,
    Color? secondaryText,
    Color? transparent,
  }) {
    return ColorStyles(
      primaryBackground: primaryBackground ?? this.primaryBackground,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  ColorStyles lerp(ThemeExtension<ColorStyles>? other, double t) {
    if (other is! ColorStyles) return this;
    return ColorStyles(
      primaryBackground:
          Color.lerp(primaryBackground, other.primaryBackground, t),
      primaryText: Color.lerp(primaryText, other.primaryText, t),
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t),
      transparent: Color.lerp(transparent, other.transparent, t),
    );
  }
}
