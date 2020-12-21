import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class AddCustomerScreenViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();
  final addCustomerFormKey = GlobalKey<FormState>();
  TextEditingController newCustomerMobileNumber = TextEditingController();

  void addCustomerDetails() {
    _navigatorService.navigateTo(Routes.addCustomerDetailsScreenView);
  }

  void addBiolegeCard() {
    _navigatorService.navigateTo(Routes.addBiolegeScreenView);
  }
}
