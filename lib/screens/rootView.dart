import '../screens/rootViewModel.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import 'splashScreen/splashItem.dart';

class Root extends StatelessWidget {
  static const routeName = "/root";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, child, model) {
        return Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildSplashContent(mainLogo, subLogo),
              LottieBuilder.asset('asset/images/loader.json'),
            ],
          )),
        );
      },
      onModelReady: (model) => model.handleStartupLogic(),
      viewModelBuilder: () => RootViewModel(),
    );
  }
}
