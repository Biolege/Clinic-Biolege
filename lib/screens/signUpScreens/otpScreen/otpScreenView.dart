import '../../../theme/theme.dart';
import '../../../widgets/animations.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import '../../../app/size_configuration.dart';
import '../../../screens/signUpScreens/otpScreen/otpScreenViewModel.dart';
import '../../../widgets/reusables.dart';

class OTPScreenView extends StatefulWidget {
  static const routeName = "/otpScreenView";

  @override
  _OTPScreenViewState createState() => _OTPScreenViewState();
}

class _OTPScreenViewState extends State<OTPScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OTPScreenViewModel>.reactive(
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
                        "We have sent you an OTP",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    FadeInLTR(
                      0.6,
                      Text(
                        'Enter the 6 digit OTP sent on \n ${model.getEnteredPhoneNumber} to proceed',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    FadeInLTR(
                      0.9,
                      Form(
                        key: model.otpFormKey,
                        child: PinCodeTextField(
                          enableActiveFill: true,
                          keyboardType: TextInputType.number,
                          appContext: context,
                          length: 6,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            borderRadius: BorderRadius.circular(50),
                            borderWidth: 0,
                            fieldHeight: 50,
                            fieldWidth: 40,
                            selectedFillColor: offWhite1,
                            inactiveFillColor: model.getErrorStatus
                                ? Colors.red[400]
                                : offWhite2,
                          ),
                          animationDuration: Duration(milliseconds: 100),
                          backgroundColor: Colors.transparent,
                          errorAnimationController: model.errorController,
                          controller: model.otpTextController,
                          textStyle: TextStyle(
                            color: offWhite,
                            fontSize: 20,
                          ),
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          onCompleted: (v) {
                            model.onComplete();
                          },
                          onChanged: (value) {
                            print(value);
                            model.setCurrentText(value);
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),
                    ),
                    Spacer(),
                    FadeInLTR(
                      1.2,
                      Row(
                        children: [
                          Text(
                            "did not receive OTP ? ",
                            style: TextStyle(fontSize: 14),
                          ),
                          InkWell(
                            onTap: () => model.getOtpCount != 0
                                ? null
                                : model.resendOTP(),
                            child: Text(
                              model.getOtpCount != 0
                                  ? 'wait ${model.getOtpCount} seconds'
                                  : "Resend OTP",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    FadeInLTR(
                        1.5,
                        buildOutlineButton(
                          "Continue",
                          !model.getErrorStatus
                              ? null
                              : () {
                                  model.startVerifingOTP();
                                },
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
      createNewModelOnInsert: true,
      onModelReady: (model) => model.initialise(context),
      viewModelBuilder: () => OTPScreenViewModel(),
    );
  }
}
