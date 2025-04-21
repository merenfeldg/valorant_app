import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:valorant_app/shared/enums/language_enum.dart';
import 'package:valorant_app/ui/design_system/themes/theme_extensions.dart';

class VavaIntlButtonItem extends StatefulWidget {
  final LanguageEnum language;
  final bool isSelected;
  final VoidCallback onPressed;

  const VavaIntlButtonItem({
    super.key,
    required this.language,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  State<VavaIntlButtonItem> createState() => _VavaIntlButtonItemState();
}

class _VavaIntlButtonItemState extends State<VavaIntlButtonItem> {
  //
  var _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _changeStateButton() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final sizeMaxWidthScreen = MediaQuery.sizeOf(context).width;

    return ElevatedButton(
      onPressed: _changeStateButton,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(sizeMaxWidthScreen, 40),
        backgroundColor: widget.isSelected ? colors.greyDarkColor : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), //
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(widget.language.image, height: 35), //
              Gap(24),
              Text(
                widget.language.name,
                style: TextStyle(
                  color: colors.whiteColor,
                  fontSize: 16, //
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          if (widget.isSelected)
            Image.asset('assets/images/check_green.png', height: 20),
        ],
      ), //
    );
  }
}
