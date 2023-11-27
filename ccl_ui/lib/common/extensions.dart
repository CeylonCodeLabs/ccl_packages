import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  TextStyle? get styleDisplayLarge => textTheme.displayLarge;

  TextStyle? get styleDisplayMedium => textTheme.displayMedium;

  TextStyle? get styleDisplaySmall => textTheme.displaySmall;

  TextStyle? get styleHeadlineLarge => textTheme.headlineLarge;

  TextStyle? get styleHeadlineMedium => textTheme.headlineMedium;

  TextStyle? get styleHeadlineSmall => textTheme.headlineSmall;

  TextStyle? get styleTitleLarge => textTheme.titleLarge;

  TextStyle? get styleTitleMedium => textTheme.titleMedium;

  TextStyle? get styleTitleSmall => textTheme.titleSmall;

  TextStyle? get styleLabelLarge => textTheme.labelLarge;

  TextStyle? get styleLabelMedium => textTheme.labelMedium;

  TextStyle? get styleLabelSmall => textTheme.labelSmall;

  TextStyle? get styleBodyLarge => textTheme.bodyLarge;

  TextStyle? get styleBodyMedium => textTheme.bodyMedium;

  TextStyle? get styleBodySmall => textTheme.bodySmall;

  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
