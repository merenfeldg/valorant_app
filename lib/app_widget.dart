import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:valorant_app/ui/design_system/themes/dark_theme.dart';

import 'app_widget.route.dart';
part 'app_widget.g.dart';

@Main('lib/ui/')
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Valorant App',
      theme: darkTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.splash,
      ),
    );
  }
}
