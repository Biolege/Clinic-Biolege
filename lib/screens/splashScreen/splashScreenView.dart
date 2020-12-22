import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clinicapp/app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../rootView.dart';
import 'splashItem.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key key,
    @required this.mainLogo,
    @required this.subLogo,
  }) : super(key: key);

  final String mainLogo;
  final String subLogo;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnimatedSplashScreen(
      splashIconSize: 120,
      curve: Curves.easeIn,
      duration: 2000,
      splash: buildSplashContent(mainLogo, subLogo),
      nextScreen: Root(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
