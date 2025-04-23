import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:valorant_app/ui/design_system/themes/theme_extensions.dart';

class VavaAgentButton extends StatelessWidget {
  final String text;
  final String image;
  final String? icon;
  final VoidCallback onTap;

  const VavaAgentButton._({
    required this.text,
    required this.image,
    required this.icon,
    required this.onTap,
  });

  factory VavaAgentButton.fullBody({
    required String text,
    required String image,
    required String icon,
    required VoidCallback onTap,
  }) {
    return VavaAgentButton._(
      text: text,
      image: image,
      icon: icon, //
      onTap: onTap,
    );
  }
  factory VavaAgentButton.portrait({
    required String text,
    required String image,
    required VoidCallback onTap,
  }) {
    return VavaAgentButton._(
      text: text,
      image: image,
      icon: null, //
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFullBody = icon != null;

    return isFullBody
        ? _ButtonFullBody(
          text: text,
          image: image,
          icon: icon!,
          onTap: onTap, //
        )
        : _ButtonPortrait(
          text: text,
          image: image,
          onTap: onTap, //
        );
  }
}

class _ButtonFullBody extends StatelessWidget {
  final String text;
  final String image;
  final String icon;
  final VoidCallback onTap;

  const _ButtonFullBody({
    required this.text,
    required this.image,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final borderRadiusAll24 = BorderRadius.circular(24);
    final isTextMoreFiveCharacter = text.length > 6;

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadiusAll24,
      child: Container(
        height: 130,
        width: 130, //
        decoration: BoxDecoration(
          color: colors.redPrimaryColor, //
          borderRadius: borderRadiusAll24,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              child: CachedNetworkImage(
                imageUrl: image, //
                height: 185,
              ),
            ),
            Positioned(
              top: -10,
              left: 118,
              child: Image.asset(
                icon, //
                height: 30,
              ), //
            ),
            Positioned(
              top: 100,
              left: _ComponentController.setPositionTextFromAmountWords(
                text.length,
              ),
              child: Text(
                text,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: colors.whiteColor,
                  fontSize: isTextMoreFiveCharacter ? 18 : 19, //
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class _ComponentController {
  static double setPositionTextFromAmountWords(int amountWords) {
    if (amountWords > 6) {
      return 72;
    } else if (amountWords <= 4) {
      return 105;
    }
    return 90;
  }
}

class _ButtonPortrait extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onTap;

  const _ButtonPortrait({
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 130,
        width: 100,
        decoration: BoxDecoration(
          color: colors.greyNormalColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Gap(8),
            CachedNetworkImage(
              imageUrl: image,
              height: 80, //
            ),
            Gap(8),
            Text(
              text,
              style: TextStyle(
                color: colors.whiteColor,
                fontSize: 16, //
              ),
            ),
          ],
        ),
      ),
    );
  }
}
