import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:valorant_app/config/dependecy_injector.dart';
import 'package:valorant_app/ui/agents/viewmodel/agent_viewmodel.dart';
import 'package:valorant_app/ui/design_system/themes/theme_extensions.dart';

import 'package:valorant_app/ui/design_system/widgets/buttons/vava_change_language_button.dart';
import 'package:valorant_app/ui/design_system/widgets/forms/vava_text_form.dart';
import 'package:valorant_app/ui/design_system/widgets/tabs/vava_tab_bar.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  final viewModel = dependecyInjector.get<AgentViewmodel>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    viewModel.addListener(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 160,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/title_logo.png'), //
                      VavaChangeLanguageButton(
                        language: 'PT',
                        country: 'BR',
                        onTap: () {}, //
                      ),
                    ],
                  ),
                ),
                Gap(16),
                VavaTextForm(onChanged: (_) {}),
              ],
            ),
          ),
        ),
        bottom: VavaTabBar(controller: _tabController),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SizedBox(), //
          SizedBox(),
        ],
      ),
    );
  }
}
