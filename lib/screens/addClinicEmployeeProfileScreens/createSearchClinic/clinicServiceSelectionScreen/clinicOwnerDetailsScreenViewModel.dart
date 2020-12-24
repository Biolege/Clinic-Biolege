import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class ClinicServiceSelectionViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  TextEditingController clinicOwnerName = TextEditingController();
  TextEditingController clinicPhoneNumber = TextEditingController();
  String _idProofType = "PAN";
  final clinicDesciptionFormKey = GlobalKey<FormState>();

  void setIdProofType(String type) {
    _idProofType = type;
    print(_idProofType);
  }

  // void navigateToWelcomeScreen() {
  //   _navigatorService.pushNamedAndRemoveUntil(Routes.welcomeScreenView,
  //       predicate:
  //           ModalRoute.withName(CreateOrSearchClinicScreenView.routeName));
  // }

  void navigateToWelcomeScreen() {
    _navigatorService.pushNamedAndRemoveUntil(Routes.welcomeScreenView,
        predicate: (route) => false);
  }
}
