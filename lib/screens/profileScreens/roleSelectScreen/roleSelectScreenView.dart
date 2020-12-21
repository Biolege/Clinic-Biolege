import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../theme/theme.dart';
import '../../../widgets/animations.dart';
import 'roleSelectScreenViewModel.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';

class RoleSelectScreenView extends StatelessWidget {
  static const routeName = "/roleSelectScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RoleSelectViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                height: SizeConfig.screenHeight * 0.8,
                child: Column(
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
                              Text(
                                "Welcome to",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Image.asset(
                                model.logo,
                                height: getProportionateScreenHeight(30),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(60),
                    ),
                    FadeInLTR(
                      0.6,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Role",
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Center(
                            child: ToggleSwitch(
                                iconSize: 12,
                                fontSize: 12,
                                minWidth: SizeConfig.screenWidth / 3.5,
                                cornerRadius: 10.0,
                                minHeight: getProportionateScreenHeight(50),
                                icons: [
                                  MaterialCommunityIcons.account_key,
                                  MaterialIcons.people,
                                  AntDesign.customerservice,
                                ],
                                initialLabelIndex: 0,
                                activeBgColor: offWhite,
                                activeFgColor: offWhite,
                                inactiveBgColor: offWhite1,
                                inactiveFgColor: offBlack2,
                                activeBgColors: [
                                  Colors.redAccent,
                                  Colors.blue,
                                  Colors.greenAccent
                                ],
                                labels: ['Admin', 'Staff', 'Receiptionist'],
                                onToggle: (index) => {
                                      index == 0
                                          ? model.setRoleValue("ADMIN")
                                          : index == 1
                                              ? model.setRoleValue("STAFF")
                                              : model
                                                  .setRoleValue("RECEIPTIONIST")
                                    }),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    FadeInLTR(
                      0.9,
                      buildOutlineButton("Continue",
                          model.navigateTocreateOrSearchClinicScreenView),
                    ),
                  ],
                ),
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => RoleSelectViewModel(),
    );
  }
}
