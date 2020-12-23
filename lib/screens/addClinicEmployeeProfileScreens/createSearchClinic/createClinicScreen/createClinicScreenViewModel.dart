import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class CreateClinicViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  TextEditingController clinicName = TextEditingController();
  TextEditingController clinicAddress = TextEditingController();
  String _clinicLocationType;
  GlobalKey createClinicForm = GlobalKey<FormState>();
  String logo = "asset/images/logo.png";

  void setClinicTypeValue(String value) {
    _clinicLocationType = value;
    print(_clinicLocationType);
  }

  void navigateToAddClinicDescriptionView() {
    _navigatorService.navigateTo(Routes.addClinicDescriptionScreenView);
  }
}
