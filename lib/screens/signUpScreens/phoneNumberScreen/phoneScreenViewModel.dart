import '../../../services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class PhoneViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // __________________________________________________________________________

  TextEditingController phoneNumber = TextEditingController();
  GlobalKey<FormState> phoneNumberFormKey = GlobalKey<FormState>();
  // __________________________________________________________________________
  // Navigation
  void navigateToOTPScreenView() {
    _navigatorService.navigateTo(Routes.oTPScreenView);
  }

  // __________________________________________________________________________
  void startVerifyPhoneAuthentication() async {
    await _authenticationService.verifyPhoneNumber("+" + phoneNumber.text);
    navigateToOTPScreenView();
  }
}
