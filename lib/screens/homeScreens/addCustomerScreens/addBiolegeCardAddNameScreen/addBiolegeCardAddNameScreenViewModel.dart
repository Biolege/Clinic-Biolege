import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class AddBiolegeCardAddNameScreenViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();
  final addCustomerNameFormKey = GlobalKey<FormState>();
  TextEditingController newCustomerName = TextEditingController();

  void customerDoctorSelection() {
    _navigatorService.navigateTo(Routes.customerDoctorSelectionScreenView);
  }
}
