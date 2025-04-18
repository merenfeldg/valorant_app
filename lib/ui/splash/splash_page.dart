import 'package:flutter/material.dart';
import 'package:valorant_app/ui/splash/animations/splash_animation_mixin.dart';

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

  @override
  void initState() {
    super.initState();

    initializeAnimations(vsync: this);
    controller.addListener(() => setState(() {}));

    controller.forward();
    Future.delayed(Duration(seconds: 1));
  }

  @override
  void dispose() {
    disposeAnimations();
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
