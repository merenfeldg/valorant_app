import 'package:flutter/widgets.dart';

mixin SplashAnimationMixin {
  late final AnimationController controller;

  late final Animation<double> sizeLogoAnimation;
  late final Animation<double> positionYTextAnimation;

  void initializeAnimations({required TickerProvider vsync}) {
    controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: vsync,
    );

    sizeLogoAnimation = Tween<double>(
      begin: 80,
      end: 110, //
    ).animate(controller);

    positionYTextAnimation = Tween<double>(
      begin: -80,
      end: -2, //
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 1), //
      ),
    );
  }

  void disposeAnimations() {
    controller.dispose();
  }
}
