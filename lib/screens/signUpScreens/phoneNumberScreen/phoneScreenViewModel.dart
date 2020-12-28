import '../../../services/services/auth_service.dart';
import '../../../app/locator.dart';
import '../../../services/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PhoneViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final StorageService _storageService = locator<StorageService>();
  // __________________________________________________________________________
  // Controller
  TextEditingController phoneNumber = TextEditingController();
  final phoneNumberFormKey = GlobalKey<FormState>();
  // __________________________________________________________________________
  // Validators

  String validatePhoneNumber(String phone) {
    return phone.isEmpty
        ? "Phone number cannot be empty"
        : phone.length == 10
            ? null
            : "Phone number should be 10 digits";
  }

  // __________________________________________________________________________
  void startVerifyPhoneAuthentication() async {
    phoneNumberFormKey.currentState.save();

    if (!phoneNumberFormKey.currentState.validate()) return;
    await _storageService.setPhoneNumber(int.parse(phoneNumber.text));
    verifyPhoneAuthentication("+91" + phoneNumber.text);
  }

  // __________________________________________________________________________
  void verifyPhoneAuthentication(String phone) async {
    await _authenticationService.verifyPhoneNumber(phone);
  }
}
