import 'package:flutter/material.dart';
import 'package:valorant_app/ui/design_system/themes/theme_extensions.dart';

class VavaRoleButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;

  const VavaRoleButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: colors.redPrimaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 90,
              width: 90,
              child: Image.asset(
                icon,
                fit: BoxFit.cover, //
              ), //
            ), //
            Text(
              text,
              style: TextStyle(
                color: colors.whiteColor, //
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
