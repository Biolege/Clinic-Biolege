import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class NameViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  TextEditingController name = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();
  String logo = "asset/images/logo.png";

  void navigateToEmailScreenView() {
    _navigatorService.navigateTo(Routes.emailScreenView);
  }
}
