import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';
import '../../../../services/services/helperData_service.dart';

class AddCustomerScreenViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final PatientDetails _patientDetailsService = locator<PatientDetails>();
  // __________________________________________________________________________
  // Controller and Variables
  final addCustomerFormKey = GlobalKey<FormState>();
  TextEditingController newCustomerMobileNumber = TextEditingController();
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
  // Helping Functions

  void addCustomerDetails() async {
    addCustomerFormKey.currentState.save();
    if (!addCustomerFormKey.currentState.validate()) return;
    _patientDetailsService
        .setDoctorsPatientPhoneNumber(newCustomerMobileNumber.text);
    _navigatorService.navigateTo(Routes.addPatientNameScreenView);
  }

  // __________________________________________________________________________
}
