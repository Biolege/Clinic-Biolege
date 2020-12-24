import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../main.dart';
import '../../../../widgets/reusables.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/animations.dart';
import 'createClinicScreenViewModel.dart';

class AddClinicScreenView extends StatelessWidget {
  static const routeName = "/createClinicScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddClinicViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                      height: getProportionateScreenHeight(20),
                    ),
                    FadeInLTR(
                      0.6,
                      Text(
                        "Create a new Clinic",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Form(
                      key: model.createClinicForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInLTR(
                            0.9,
                            Text(
                              "Clinic Name",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          FadeInLTR(
                            0.9,
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 30,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              keyboardType: TextInputType.name,
                              decoration: buildInputDecoration(
                                  "Clinic Name",
                                  Icon(
                                    MaterialCommunityIcons.account,
                                    color: primaryColor,
                                  )),
                              controller: model.clinicName,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          FadeInLTR(
                            1.2,
                            Text(
                              "Clinic Phone Number",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          FadeInLTR(
                            1.2,
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 10,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              keyboardType: TextInputType.phone,
                              decoration: buildInputDecoration(
                                  "Clinic Phone Number",
                                  Icon(
                                    MaterialCommunityIcons.phone,
                                    color: primaryColor,
                                  )),
                              controller: model.clinicPhoneNumber,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          FadeInLTR(
                            1.5,
                            Text(
                              "Clinic Location",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          FadeInLTR(
                            1.5,
                            Center(
                              child: ToggleSwitch(
                                  minWidth: SizeConfig.screenWidth / 2.4,
                                  minHeight: getProportionateScreenHeight(40),
                                  fontSize: 12,
                                  initialLabelIndex: 0,
                                  activeBgColor: offWhite,
                                  activeFgColor: offBlack2,
                                  inactiveBgColor: offWhite1,
                                  inactiveFgColor: offBlack2,
                                  activeBgColors: [
                                    Colors.lime,
                                    Colors.greenAccent
                                  ],
                                  labels: [
                                    'Attached to Pharmacy',
                                    'Separate Clinic'
                                  ],
                                  onToggle: (index) => {
                                        index == 0
                                            ? model.setClinicTypeValue(
                                                "ATTACH TO PHARMACY")
                                            : model.setClinicTypeValue(
                                                "SEPERATE CLINIC")
                                      }),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          FadeInLTR(
                            2.1,
                            Text(
                              "Clinic Logo",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          FadeInLTR(
                            2.1,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildBasicOutlineButton(
                                    Text(
                                      "Upload Photo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    () {}),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    FadeInLTR(
                      2.1,
                      buildOutlineButton(
                          "Continue", model.navigateToAddClinicDescriptionView),
                    ),
                  ],
                ),
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => AddClinicViewModel(),
    );
  }
}
