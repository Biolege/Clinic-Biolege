import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../theme/theme.dart';
import '../../../widgets/animations.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';
import '../../../main.dart';
import 'emailScreenViewModel.dart';

class EmailScreenView extends StatelessWidget {
  static const routeName = "/emailScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailViewModel>.reactive(
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
                        0.9,
                        Text(
                          "Enter Email",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      FadeInLTR(
                        1.2,
                        Form(
                            key: model.emailFormKey,
                            child: TextFormField(
                              validator: (value) => model.validateEmail(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              decoration: buildInputDecoration(
                                  "Email",
                                  Icon(
                                    AntDesign.mail,
                                    color: primaryColor,
                                  )),
                              controller: model.email,
                            )),
                      ),
                      Spacer(),
                      FadeInLTR(
                          1.5,
                          buildOutlineButton(
                            "Continue",
                            model.saveEmailAddress,
                          )),
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      ),
                      FadeInLTR(
                        1.8,
                        Text(
                          "by clicking on continue, you are indicating that you have read and agree to our terms of use & privacy policy",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          );
        },
        viewModelBuilder: () => EmailViewModel());
  }
}
