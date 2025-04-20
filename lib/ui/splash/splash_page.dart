import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:valorant_app/app_widget.dart';
import 'package:valorant_app/config/dependecy_injector.dart';
import 'package:valorant_app/ui/splash/animations/splash_animation_mixin.dart';
import 'package:valorant_app/ui/splash/viewmodels/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin, SplashAnimationMixin {
  //
  final logoValorantPathImage =
      'lib/ui/design_system/assets/images/logo_valorant.png';

  final _viewModel = dependecyInjector.get<SplashViewmodel>();

  @override
  void initState() {
    super.initState();

    _viewModel.getLanguageCommand.addListener(_listanable);
    initializeAnimations(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.addListener(() => setState(() {}));
      controller.forward();

      Future.delayed(
        const Duration(seconds: 2),
      ).then((_) => _viewModel.getLanguageCommand.execute());
    });
  }

  void _listanable() {
    if (_viewModel.getLanguageCommand.isSuccess) {
      Routefly.navigate(routePaths.agents);
    } else {
      Routefly.navigate(routePaths.selectLanguage);
    }
  }

  @override
  void dispose() {
    disposeAnimations();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              logoValorantPathImage,
              height: sizeLogoAnimation.value, //
            ),
            ClipRRect(
              child: Transform.translate(
                offset: Offset(0, positionYTextAnimation.value),
                child: Text(
                  'Valorant App',
                  style: TextStyle(
                    color: Colors.white, //
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ), //
      ),
    );
  }
}
