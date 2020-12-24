import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class AddClinicViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  String _clinicLocationType;
  GlobalKey createClinicForm = GlobalKey<FormState>();
  TextEditingController clinicName = TextEditingController();
  TextEditingController clinicPhoneNumber = TextEditingController();
  TextEditingController clinicAddress = TextEditingController();

  void setClinicTypeValue(String value) {
    _clinicLocationType = value;
    print(_clinicLocationType);
  }

  void navigateToAddClinicDescriptionView() {
    _navigatorService.navigateTo(Routes.addClinicDescriptionScreenView);
  }
}
