import 'package:decreptop/configuration/themes/colors/_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  ColorScheme colors = lightColorScheme();
  ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    colorScheme: colors,
  );
}
