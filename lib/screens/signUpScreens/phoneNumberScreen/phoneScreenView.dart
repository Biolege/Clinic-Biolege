import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../screens/signUpScreens/phoneNumberScreen/phoneScreenViewModel.dart';
import '../../../theme/theme.dart';
import '../../../widgets/animations.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';

class PhoneScreenView extends StatelessWidget {
  static const routeName = "/phoneScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneViewModel>.reactive(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    FadeInLTR(
                      0.3,
                      Text(
                        "Welcome,",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    FadeInLTR(
                      0.6,
                      Text(
                        "Please enter your mobile number",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    FadeInLTR(
                      0.9,
                      Form(
                          key: model.phoneNumberFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: TextFormField(
                            validator: (value) =>
                                model.validatePhoneNumber(value),
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            keyboardType: TextInputType.phone,
                            decoration: buildInputDecoration(
                                "Mobile Number",
                                Icon(
                                  AntDesign.mobile1,
                                  color: primaryColor,
                                )),
                            controller: model.phoneNumber,
                          )),
                    ),
                    Spacer(),
                    FadeInLTR(
                      1.2,
                      buildOutlineButton(
                          "Continue", model.startVerifyPhoneAuthentication),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(60),
                    ),
                    FadeInLTR(
                      1.5,
                      Text(
                        "by clicking on continue, you are indicating that you have read and agree to our terms of use & privacy policy",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ))),
          );
        },
        viewModelBuilder: () => PhoneViewModel());
  }
}
