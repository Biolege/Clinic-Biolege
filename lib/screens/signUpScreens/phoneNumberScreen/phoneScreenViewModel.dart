import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../services/auth_service.dart';
import '../../../app/locator.dart';

class PhoneViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  // __________________________________________________________________________
  // Controller
  TextEditingController phoneNumber = TextEditingController();
  GlobalKey<FormState> phoneNumberFormKey = GlobalKey<FormState>();

  // __________________________________________________________________________
  void startVerifyPhoneAuthentication() async {
    await _authenticationService.verifyPhoneNumber("+91" + phoneNumber.text);
  }
}
