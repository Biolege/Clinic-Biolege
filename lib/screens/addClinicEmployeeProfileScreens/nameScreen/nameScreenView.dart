import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'nameScreenViewModel.dart';
import '../../../main.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';
import '../../../theme/theme.dart';
import '../../../widgets/animations.dart';

class NameScreenView extends StatelessWidget {
  static const routeName = "/nameScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NameViewModel>.reactive(
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
                        "Tell us your name",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    FadeInLTR(
                      1.2,
                      Form(
                          key: model.nameFormKey,
                          child: TextFormField(
                            maxLength: 30,
                            validator: (value) => model.validateName(value),
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            decoration: buildInputDecoration(
                                "Name",
                                Icon(
                                  MaterialCommunityIcons.account,
                                  color: primaryColor,
                                )),
                            controller: model.name,
                          )),
                    ),
                    Spacer(),
                    FadeInLTR(
                      1.5,
                      buildOutlineButton("Continue", model.saveName),
                    ),
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
      viewModelBuilder: () => NameViewModel(),
    );
  }
}
