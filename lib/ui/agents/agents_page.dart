import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:result_dart/result_dart.dart';
import 'package:valorant_app/config/dependecy_injector.dart';
import 'package:valorant_app/domain/models/agent_model.dart';
import 'package:valorant_app/shared/enums/role_enum.dart';
import 'package:valorant_app/ui/agents/viewmodel/agent_states.dart';
import 'package:valorant_app/ui/agents/viewmodel/agent_viewmodel.dart';
import 'package:valorant_app/ui/design_system/themes/theme_extensions.dart';
import 'package:valorant_app/ui/design_system/widgets/buttons/vava_agent_button.dart';

import 'package:valorant_app/ui/design_system/widgets/buttons/vava_change_language_button.dart';
import 'package:valorant_app/ui/design_system/widgets/buttons/vava_role_button.dart';
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
    viewModel.getAgents();
  }

  @override
  void dispose() {
    _tabController.dispose();
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colors = context.colors;

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
                        language: 'EN',
                        country: 'US',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                Gap(16),
                ValueListenableBuilder(
                  valueListenable: viewModel,
                  builder: (_, state, __) {
                    return switch (state) {
                      LoadedAgentsState(:final agents) => Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 36,
                                mainAxisSpacing: 64,
                                mainAxisExtent: 140,
                              ),
                          padding: EdgeInsets.all(16),
                          itemCount: agents.length,
                          itemBuilder: (_, index) {
                            final agent = agents[index];
                            return VavaAgentButton.fullBody(
                              text: agent.name,
                              image: agent.fullBodyImage,
                              icon: agent.role.image,
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                      NotFoundAgentState() => Column(
                        children: [
                          Gap(16),
                          Image.asset(
                            'assets/images/shrug_bear.png',
                            height: 300,
                          ),
                          Text(
                            'Agent Not Found',
                            style: TextStyle(
                              color: colors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                      InitialState() => Center(
                        child: Text(
                          'Initial',
                          style: TextStyle(color: Colors.white),
                        ), //
                      ),
                    };
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                Gap(16),
                Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 36,
                      mainAxisSpacing: 64,
                      mainAxisExtent: 140,
                    ),
                    padding: EdgeInsets.all(16),
                    children: [
                      VavaRoleButton(
                        text: RoleEnum.controller.name,
                        icon: RoleEnum.controller.image,
                        onTap: () {},
                      ),
                      VavaRoleButton(
                        text: RoleEnum.duelist.name,
                        icon: RoleEnum.duelist.image,
                        onTap: () {},
                      ),
                      VavaRoleButton(
                        text: RoleEnum.sentinel.name,
                        icon: RoleEnum.sentinel.image,
                        onTap: () {},
                      ),
                      VavaRoleButton(
                        text: RoleEnum.initiator.name,
                        icon: RoleEnum.initiator.image,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
