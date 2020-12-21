import '../../theme/theme.dart';
import 'package:flutter/material.dart';
import 'onBoardingItems.dart';

Widget buildOnBoardingScreen(
    BuildContext context, void Function() navigateToSignUp) {
  final pages = [
    SkOnboardingModel(
        title: '',
        description: 'Keep update about your daily appointments',
        titleColor: Colors.transparent,
        descripColor: offBlack,
        imagePath: 'asset/images/1.png'),
    SkOnboardingModel(
        title: '',
        description: 'See all patient records at finger tips',
        titleColor: Colors.transparent,
        descripColor: offBlack,
        imagePath: 'asset/images/2.png'),
    SkOnboardingModel(
        title: 'Your patients are waiting ',
        description: 'An all round app made for doctors',
        titleColor: primaryColor,
        descripColor: offBlack,
        imagePath: 'asset/images/3.png'),
  ];

  return SKOnboardingScreen(
    bgColor: offWhite,
    themeColor: primaryColor,
    pages: pages,
    getStartedClicked: (tapped) => navigateToSignUp(),
  );
}
