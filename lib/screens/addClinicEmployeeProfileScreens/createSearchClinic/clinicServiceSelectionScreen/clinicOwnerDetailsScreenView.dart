import 'package:clinicapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../widgets/reusables.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/animations.dart';
import 'clinicOwnerDetailsScreenViewModel.dart';

class ClinicServiceSelectionView extends StatelessWidget {
  static const routeName = "/clinicServiceSelectionView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClinicServiceSelectionViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Container(
                height: SizeConfig.screenHeight * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FadeInLTR(
                          0.3,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                mainLogo,
                                height: getProportionateScreenHeight(25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    FadeInLTR(
                      0.6,
                      Text(
                        "Services available",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Form(
                        key: model.clinicDesciptionFormKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildBasicOutlineButton(
                                    Text("Blood Test"), () {}),
                                buildBasicOutlineButton(Text("X - Ray"), () {}),
                                buildBasicOutlineButton(Text("MRI"), () {})
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildBasicOutlineButton(Text("ECG"), () {}),
                                buildBasicOutlineButton(
                                    Text("Sonography"), () {}),
                              ],
                            ),
                          ],
                        )),
                    Spacer(),
                    FadeInLTR(
                        1.8,
                        Row(
                          children: [
                            buildOutlineButton(
                              "Continue",
                              model.navigateToWelcomeScreen,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => ClinicServiceSelectionViewModel(),
    );
  }
}
