import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../widgets/reusables.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/animations.dart';
import 'enterClinicDescriptionScreenViewModel.dart';

class AddClinicDescriptionScreenView extends StatelessWidget {
  static const routeName = "/addClinicDescriptionScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddClinicDescriptionViewModel>.reactive(
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
                                model.logo,
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
                    Form(
                        key: model.clinicDesciptionFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInLTR(
                              0.6,
                              Text(
                                "Clinic Owner Name",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            FadeInLTR(
                              0.6,
                              TextFormField(
                                maxLength: 50,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.name,
                                decoration: buildInputDecoration(
                                    "Name",
                                    Icon(
                                      MaterialCommunityIcons.account,
                                      color: primaryColor,
                                    )),
                                controller: model.clinicOwnerName,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            FadeInLTR(
                              0.9,
                              Text(
                                "Clinic Phone Number",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            FadeInLTR(
                              0.9,
                              TextFormField(
                                maxLength: 12,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.phone,
                                decoration: buildInputDecoration(
                                    "Phone Number",
                                    Icon(
                                      MaterialCommunityIcons.account,
                                      color: primaryColor,
                                    )),
                                controller: model.clinicOwnerName,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            FadeInLTR(
                              1.2,
                              Text(
                                "Clinic Owner ID proof",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.2,
                              Center(
                                child: ToggleSwitch(
                                    minWidth: SizeConfig.screenWidth / 3.5,
                                    minHeight: getProportionateScreenHeight(40),
                                    fontSize: 12,
                                    initialLabelIndex: 0,
                                    activeBgColor: offWhite,
                                    activeFgColor: offWhite1,
                                    inactiveBgColor: offWhite1,
                                    inactiveFgColor: offBlack2,
                                    activeBgColors: [
                                      Colors.blueGrey,
                                      Colors.blueGrey,
                                      Colors.blueGrey
                                    ],
                                    labels: [
                                      'PAN Card',
                                      'Aadhar Card',
                                      'Voter Card'
                                    ],
                                    onToggle: (index) => {
                                          index == 0
                                              ? model.setIdProofType("PAN")
                                              : index == 1
                                                  ? model
                                                      .setIdProofType("AADHAR")
                                                  : model
                                                      .setIdProofType("VOTER")
                                        }),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.2,
                              Row(
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
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            FadeInLTR(
                              1.5,
                              Text(
                                "Clinic on Map",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.5,
                              buildBasicOutlineButton(
                                  Text(
                                    "Show in Map",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                  () {}),
                            ),
                          ],
                        )),
                    Spacer(),
                    FadeInLTR(
                      1.8,
                      buildOutlineButton(
                        "Continue",
                        model.navigateToWelcomeScreen,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => AddClinicDescriptionViewModel(),
    );
  }
}
