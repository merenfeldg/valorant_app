import 'package:flutter/material.dart';
import 'package:valorant_app/shared/enums/language_enum.dart';
import 'package:valorant_app/ui/design_system/widgets/buttons/intl/vava_intl_button_item.dart';

class VavaIntlButtonListControl extends StatefulWidget {
  //
  final List<VavaIntlButtonItem> children;
  final void Function(LanguageEnum) onChanged;

  const VavaIntlButtonListControl({
    super.key,
    required this.children,
    required this.onChanged,
  });

  @override
  State<VavaIntlButtonListControl> createState() =>
      _VavaIntlButtonListControlState();
}

class _VavaIntlButtonListControlState extends State<VavaIntlButtonListControl> {
  var indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.children.length,
      itemBuilder: (_, index) {
        final intlButton = widget.children[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: VavaIntlButtonItem(
            onPressed: () {
              indexSelected = index;
              widget.onChanged(intlButton.language);
            },
            language: intlButton.language,
            isSelected: (indexSelected == index),
          ),
        );
      },
    );
  }
}
