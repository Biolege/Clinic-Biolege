import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../theme/theme.dart';
import '../../widgets/animations.dart';

import '../../widgets/reusables.dart';
import '../../app/size_configuration.dart';
import 'welcomeScreenViewModel.dart';

class WelcomeScreenView extends StatelessWidget {
  static const routeName = "/welcomeScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: SizeConfig.screenHeight * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    FadeInLTR(
                      0.3,
                      Text(
                        "Welcome to",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    FadeInLTR(
                      0.6,
                      Image.asset(
                        model.logo,
                        height: getProportionateScreenHeight(30),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    FadeInLTR(
                      0.9,
                      Text(
                        "Mr. Sourav Agarwal",
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    FadeInLTR(
                      1.2,
                      Text(
                        "Owner",
                        style: TextStyle(fontSize: 18, color: offBlack2),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    FadeInLTR(
                      1.2,
                      Text(
                        "Raj Medical Clinic",
                        style: TextStyle(fontSize: 20, color: offBlack2),
                      ),
                    ),
                    Spacer(),
                    FadeInLTR(
                      1.5,
                      buildOutlineButton(
                          "Dashboard", model.navigateToHomePageView),
                    ),
                  ],
                ),
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => WelcomeScreenViewModel(),
    );
  }
}
