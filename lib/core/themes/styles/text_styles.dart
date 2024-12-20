import 'package:flutter/material.dart';

class TextStyles extends ThemeExtension<TextStyles> {
  final TextStyle? largeTitle;
  final TextStyle? mediumTitle;
  final TextStyle? smallUsername;
  final TextStyle? smallLikes;
  final TextStyle? largeUsername;
  final TextStyle? mediumLikes;
  final TextStyle? textButtonStyle;

  const TextStyles({
    this.largeTitle,
    this.mediumTitle,
    this.smallUsername,
    this.smallLikes,
    this.largeUsername,
    this.mediumLikes,
    this.textButtonStyle,
  });

  @override
  TextStyles copyWith({
    TextStyle? largeTitle,
    TextStyle? mediumTitle,
    TextStyle? smallUsername,
    TextStyle? smallLikes,
    TextStyle? largeUsername,
    TextStyle? mediumLikes,
    TextStyle? textButtonStyle,
  }) {
    return TextStyles(
      largeTitle: largeTitle ?? this.largeTitle,
      mediumTitle: mediumTitle ?? this.mediumTitle,
      smallUsername: smallUsername ?? this.smallUsername,
      smallLikes: smallLikes ?? this.smallLikes,
      largeUsername: largeUsername ?? this.largeUsername,
      mediumLikes: mediumLikes ?? this.mediumLikes,
      textButtonStyle: textButtonStyle ?? this.textButtonStyle,
    );
  }

  @override
  TextStyles lerp(ThemeExtension<TextStyles>? other, double t) {
    if (other is! TextStyles) return this;
    return TextStyles(
      largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t),
      mediumTitle: TextStyle.lerp(mediumTitle, other.mediumTitle, t),
      smallUsername: TextStyle.lerp(smallUsername, other.smallUsername, t),
      smallLikes: TextStyle.lerp(smallLikes, other.smallLikes, t),
      largeUsername: TextStyle.lerp(largeUsername, other.largeUsername, t),
      mediumLikes: TextStyle.lerp(mediumLikes, other.mediumLikes, t),
      textButtonStyle:
          TextStyle.lerp(textButtonStyle, other.textButtonStyle, t),
    );
  }
}
