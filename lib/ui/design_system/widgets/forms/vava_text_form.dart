import 'package:flutter/material.dart';
import 'package:valorant_app/ui/design_system/themes/theme_extensions.dart';

class VavaTextForm extends StatelessWidget {
  //
  final void Function(String) onChanged;

  const VavaTextForm({
    super.key,
    required this.onChanged, //
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      height: 40,
      child: TextFormField(
        style: TextStyle(color: colors.greyLightColor),
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: colors.greyNormalColor,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 30, right: 10),
            child: Icon(
              Icons.search,
              color: colors.greyLightColor, //
            ),
          ),
          hintText: 'Search for agent...', //
          hintStyle: TextStyle(
            color: colors.greyLightColor, //
            fontSize: 12,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              style: BorderStyle.none, //
            ),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
