import 'package:flutter/material.dart';
import 'package:valorant_app/ui/design_system/themes/theme_extensions.dart';

class VavaChangeLanguageButton extends StatelessWidget {
  //
  final String language;
  final String country;
  final VoidCallback onTap;

  const VavaChangeLanguageButton({
    super.key,
    required this.language,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Text(
              language,
              style: TextStyle(
                color: colors.greyLightColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              country,
              style: TextStyle(
                color: colors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
