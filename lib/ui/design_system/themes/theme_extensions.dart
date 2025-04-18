import 'package:flutter/material.dart';
import 'package:valorant_app/ui/design_system/themes/app_colors.dart';

extension ThemeDataColorsExtension on ThemeData {
  AppColors get colors => extension<AppColors>()!;
}

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColors get colors => Theme.of(this).colors;
}
