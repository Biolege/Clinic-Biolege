import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'onBoardingView.dart';
import 'onBoardingScreenViewModel.dart';

class OnBoardingScreen extends StatelessWidget {
  static const routeName = "/onBoardingScreen";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
        builder: (context, model, child) {
          return buildOnBoardingScreen(
              context, model.navigateToPhoneNumberScreen);
        },
        viewModelBuilder: () => OnBoardingViewModel());
  }
}
