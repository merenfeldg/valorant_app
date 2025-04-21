import 'package:flutter/material.dart';
import 'package:valorant_app/ui/design_system/themes/theme_extensions.dart';

class VavaButton extends StatelessWidget {
  //
  final String text;
  final VoidCallback onPressed;

  const VavaButton({
    super.key,
    required this.text,
    required this.onPressed, //
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final whiteColor = colors.whiteColor;
    final redColor = colors.redPrimaryColor;
    final sizeMaxWidthScreen = MediaQuery.sizeOf(context).width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        minimumSize: Size(sizeMaxWidthScreen, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), //
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: whiteColor, //
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ), //
    );
  }
}
