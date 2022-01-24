import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/animations.dart';
import 'addCustomerDetailsScreenViewModel.dart';
import '../../../../widgets/reusables.dart';
import '../../../../app/size_configuration.dart';

class AddCustomerDetailsScreenView extends StatelessWidget {
  static const routeName = "/addCustomerDetailsScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCustomerDetailsScreenViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            appBar: buildAppBarWithLogoAndText(context, "", Text("Today")),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    FadeInLTR(
                      0.6,
                      Text(
                        "Patient Detail",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    FadeInLTR(
                      0.3,
                      Form(
                          key: model.customerDetailsFormKey,
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
                                    totalSwitches: 2,
                                    iconSize: 50,
                                    minWidth: getProportionateScreenWidth(120),
                                    minHeight: 50,
                                    icons: [
                                      Foundation.male_symbol,
                                      Foundation.female_symbol,
                                    ],
                                    initialLabelIndex: 0,
                                    activeBgColor: List.from([offWhite]),
                                    activeFgColor: offWhite,
                                    inactiveBgColor: offWhite,
                                    inactiveFgColor: offBlack2,
                                    activeBgColors: List.from(
                                        [Colors.blue[300], Colors.pink]),
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
                                onTap: () => model.selectAssignedDate(context),
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
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Text(
                                "Blood Group",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) =>
                                    model.validateBloodGroup(value),
                                keyboardType: TextInputType.name,
                                maxLength: 3,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                decoration: buildInputDecoration(
                                    "Blood Group",
                                    Icon(
                                      FontAwesome.heartbeat,
                                      color: primaryColor,
                                    )),
                                controller: model.bloodGroup,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Text(
                                "Age",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) => model.validateAge(value),
                                keyboardType: TextInputType.number,
                                maxLength: 2,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                decoration: buildInputDecoration(
                                    "Age",
                                    Icon(
                                      Entypo.man,
                                      color: primaryColor,
                                    )),
                                controller: model.age,
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    FadeInLTR(
                        1.2,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            buildOutlineButton(
                              "Continue",
                              model.saveCustomerDetails,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            )),
          );
        },
        viewModelBuilder: () => AddCustomerDetailsScreenViewModel());
  }
}
