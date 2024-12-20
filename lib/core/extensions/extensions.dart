import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_app/core/themes/styles/color_styles.dart';
import 'package:test_app/core/themes/styles/text_styles.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  TextStyles get text => Theme.of(this).extension<TextStyles>()!;

  ColorStyles get color => Theme.of(this).extension<ColorStyles>()!;
}
