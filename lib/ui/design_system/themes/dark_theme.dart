import 'package:flutter/material.dart';
import 'package:valorant_app/ui/design_system/themes/app_colors.dart';

ThemeData get darkTheme {
  final colors = AppColors();

  return ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: colors.redPrimaryColor,
      onPrimary: colors.redPrimaryColor,
      secondary: colors.greyDarkColor,
      onSecondary: colors.greyDarkColor,
      error: colors.redPrimaryColor,
      onError: colors.redPrimaryColor,
      surface: colors.blackBackgroundColor,
      onSurface: colors.blackBackgroundColor,
    ),
    extensions: [AppColors()],
  );
}
