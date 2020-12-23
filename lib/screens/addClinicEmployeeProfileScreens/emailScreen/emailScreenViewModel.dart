import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:validators/validators.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../services/services/local_storage.dart';

class EmailViewModel extends BaseViewModel {
  // _________________________________________________________________________
  // Locating the Dependencies

  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  // final SnackbarService _snackBarService = locator<SnackbarService>();
  // _________________________________________________________________________
  // Controllers and Variables

  TextEditingController email = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  // _________________________________________________________________________
  //Validating entered Email Address

  String validateEmail(String value) {
    return value.isEmpty
        ? "Email cannot be empty"
        : isEmail(value)
            ? null
            : "Enter a valid email address";
  }

  // _________________________________________________________________________
  // Saving Email Address
  void saveEmailAddress() async {
    emailFormKey.currentState.save();
    if (!emailFormKey.currentState.validate()) return;

    await _storageService
        .setEmailAddress(email.text)
        .whenComplete(() => navigateToGenderDOBView());
  }

  void navigateToGenderDOBView() {
    _navigatorService.navigateTo(Routes.genderScreenView);
  }
  // _________________________________________________________________________
}
