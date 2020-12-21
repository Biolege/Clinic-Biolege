import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'addressScreenViewModel.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';
import '../../../theme/theme.dart';
import '../../../widgets/animations.dart';

class AddressScreenView extends StatelessWidget {
  static const routeName = "/addressScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
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
                      height: getProportionateScreenHeight(10),
                    ),
                    FadeInLTR(
                      0.6,
                      Text(
                        "Address Details",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Form(
                        key: model.address,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInLTR(
                              0.9,
                              Text(
                                "State",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            FadeInLTR(
                              0.9,
                              TextFormField(
                                maxLength: 40,
                                maxLengthEnforced: true,
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                    "State",
                                    Icon(
                                      Feather.map,
                                      color: primaryColor,
                                    )),
                                controller: model.state,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.2,
                              Text(
                                "City",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.2,
                              TextFormField(
                                maxLength: 40,
                                maxLengthEnforced: true,
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                    "City Name",
                                    Icon(
                                      MaterialCommunityIcons.city,
                                      color: primaryColor,
                                    )),
                                controller: model.city,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.5,
                              Text(
                                "Pincode",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.5,
                              TextFormField(
                                maxLength: 10,
                                maxLengthEnforced: true,
                                keyboardType: TextInputType.number,
                                decoration: buildInputDecoration(
                                    "Pincode",
                                    Icon(
                                      Feather.map_pin,
                                      color: primaryColor,
                                    )),
                                controller: model.pinCode,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.8,
                              Text(
                                "Home Address",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.8,
                              TextFormField(
                                maxLength: 150,
                                maxLengthEnforced: true,
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                    "Home Address",
                                    Icon(
                                      MaterialCommunityIcons.home_city,
                                      color: primaryColor,
                                    )),
                                controller: model.homeAddress,
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    FadeInLTR(
                      2.1,
                      buildOutlineButton(
                        "Continue",
                        model.navigateToRoleSelectView,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => AddressViewModel(),
    );
  }
}
