import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color redPrimaryColor;
  final Color blackBackgroundColor;

  final Color greyDarkColor;
  final Color greyNormalColor;
  final Color greyLightColor;
  final Color greyTextColor;

  final Color blackColor;
  final Color whiteColor;

  AppColors({
    this.redPrimaryColor = const Color(0xFFF74451),
    this.blackBackgroundColor = const Color(0xFF18191B),
    this.greyDarkColor = const Color(0xFF28292B),
    this.greyNormalColor = const Color(0xFF36373B),
    this.greyLightColor = const Color(0xFF898B8C),
    this.greyTextColor = const Color(0xFFB7B7B7),
    this.blackColor = const Color(0xFF000000),
    this.whiteColor = const Color(0xFFFFFFFF),
  });

  @override
  AppColors copyWith({
    Color? redPrimaryColor,
    Color? blackBackgroundColor,
    Color? greyDarkColor,
    Color? greyNormalColor,
    Color? greyLightColor,
    Color? greyTextColor,
    Color? blackColor,
    Color? whiteColor,
  }) {
    return AppColors(
      redPrimaryColor: redPrimaryColor ?? this.redPrimaryColor,
      blackBackgroundColor: blackBackgroundColor ?? this.blackBackgroundColor,
      greyDarkColor: greyDarkColor ?? this.greyDarkColor,
      greyNormalColor: greyNormalColor ?? this.greyNormalColor,
      greyLightColor: greyLightColor ?? this.greyLightColor,
      greyTextColor: greyTextColor ?? this.greyTextColor,
      blackColor: blackColor ?? this.blackColor,
      whiteColor: whiteColor ?? this.whiteColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      redPrimaryColor: Color.lerp(redPrimaryColor, other.redPrimaryColor, t)!,
      blackBackgroundColor:
          Color.lerp(blackBackgroundColor, other.blackBackgroundColor, t)!,
      greyDarkColor: Color.lerp(greyDarkColor, other.greyDarkColor, t)!,
      greyNormalColor: Color.lerp(greyNormalColor, other.greyNormalColor, t)!,
      greyLightColor: Color.lerp(greyLightColor, other.greyLightColor, t)!,
      greyTextColor: Color.lerp(greyTextColor, other.greyTextColor, t)!,
      blackColor: Color.lerp(blackColor, other.blackColor, t)!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
    );
  }
}
