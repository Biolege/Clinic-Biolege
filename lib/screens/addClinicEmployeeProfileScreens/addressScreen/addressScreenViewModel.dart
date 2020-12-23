import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class AddressViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  String logo = "asset/images/logo.png";

  GlobalKey address = GlobalKey<FormState>();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  void navigateToRoleSelectView() {
    _navigatorService.navigateTo(Routes.roleSelectScreenView);
  }
}
