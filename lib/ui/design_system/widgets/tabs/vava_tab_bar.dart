import 'package:flutter/material.dart';
import 'package:valorant_app/ui/design_system/themes/theme_extensions.dart';

class VavaTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;

  const VavaTabBar({
    super.key,
    required this.controller, //
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return TabBar(
      controller: controller,
      indicatorPadding: EdgeInsets.only(top: 46, left: 16, right: 16),
      indicatorWeight: 4,
      unselectedLabelColor: colors.whiteColor,
      indicator: BoxDecoration(
        color: colors.redPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold, //
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal, //
      ),
      tabs: [
        Tab(text: 'Agents'), //
        Tab(text: 'Funções'),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
