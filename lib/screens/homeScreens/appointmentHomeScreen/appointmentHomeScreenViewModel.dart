import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class AppointmentHomeScreenViewModel extends BaseViewModel {
  TextEditingController searchedPatient = TextEditingController();
  final NavigationService _navigatorService = locator<NavigationService>();
  void openPatientDetailsView() {
    _navigatorService.navigateTo(Routes.patientDetailsScreenView);
  }

  void addPatientView() {
    _navigatorService.navigateTo(Routes.addCustomerScreenView);
  }
}
