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
    final isTextMoreFiveCharacter = text.length > 5;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150, //
        decoration: BoxDecoration(
          color: colors.redPrimaryColor, //
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -10,
              right: -18,
              child: CachedNetworkImage(
                imageUrl: image, //
                height: 200,
              ),
            ),
            Positioned(
              top: 110,
              left: isTextMoreFiveCharacter ? 97 : 120,
              child: Text(
                text,
                style: TextStyle(
                  color: colors.whiteColor,
                  fontSize: isTextMoreFiveCharacter ? 18 : 24, //
                  fontWeight: FontWeight.bold,
                ),
              ), //
            ),
            Positioned(
              top: -15,
              left: 132,
              child: Image.asset(
                icon, //
                height: 36,
              ), //
            ),
          ],
        ),
      ),
    );
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
            Image.network(
              image,
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
