import 'dart:async';
import '../../../app/router.gr.dart';
import '../../../services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';

class OTPScreenViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // __________________________________________________________________________

  var onTapRecognizer;
  bool _hasError = false;
  String _currentText = "";
  StreamController<ErrorAnimationType> errorController;
  TextEditingController otpTextController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey otpFormKey = GlobalKey<FormState>();

  bool get getErrorStatus => _hasError;

  void onComplete() {
    _hasError = _currentText.length < 6 ? false : true;
    notifyListeners();
  }

  void setCurrentText(String value) {
    _hasError = _currentText.length < 6 ? false : true;
    _currentText = value;
    notifyListeners();
  }

  void navigateToNameScreen() {
    _navigatorService.navigateTo(Routes.nameScreenView);
  }

  void verifyOTP() {
    _authenticationService.signInPhoneNumberWithOTP(otpTextController.text);
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  void initialise(BuildContext context) {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
  }
}
