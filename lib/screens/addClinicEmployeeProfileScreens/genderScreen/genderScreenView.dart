import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../theme/theme.dart';
import '../../../widgets/animations.dart';
import '../../../main.dart';
import 'genderScreenViewModel.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';

class GenderScreenView extends StatelessWidget {
  static const routeName = "/genderScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GenderViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            appBar: buildAppBar(context),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainLogo,
                          height: getProportionateScreenHeight(30),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      ),
                      FadeInLTR(
                        0.6,
                        Form(
                            key: model.genderFormKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(20),
                                ),
                                Center(
                                  child: ToggleSwitch(
                                      iconSize: 50,
                                      minWidth:
                                          getProportionateScreenWidth(120),
                                      minHeight: 50,
                                      icons: [
                                        Foundation.male_symbol,
                                        Foundation.female_symbol,
                                      ],
                                      initialLabelIndex: 0,
                                      activeBgColor: offWhite,
                                      activeFgColor: offWhite,
                                      inactiveBgColor: offWhite,
                                      inactiveFgColor: offBlack2,
                                      activeBgColors: [
                                        Colors.blue[300],
                                        Colors.pink
                                      ],
                                      labels: ['Male', 'Female'],
                                      onToggle: (index) => {
                                            index == 0
                                                ? model.setGenderValue("MALE")
                                                : model.setGenderValue("FEMALE")
                                          }),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(30),
                                ),
                                Text(
                                  "DOB",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(20),
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) => model.validateDate(),
                                  onTap: () =>
                                      model.selectAssignedDate(context),
                                  controller: model.dob,
                                  readOnly: true,
                                  keyboardType: TextInputType.datetime,
                                  decoration: buildInputDecoration(
                                      "Select Date",
                                      Icon(
                                        AntDesign.calendar,
                                        color: primaryColor,
                                      )),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Spacer(),
                      FadeInLTR(
                          1.2,
                          buildOutlineButton(
                            "Continue",
                            model.saveDobAndGender,
                          )),
                    ],
                  ),
                ),
              ),
            )),
          );
        },
        viewModelBuilder: () => GenderViewModel());
  }
}
