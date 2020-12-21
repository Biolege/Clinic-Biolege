import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class EmailViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  TextEditingController email = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  String logo = "asset/images/logo.png";

  void navigateToGenderDOBView() {
    _navigatorService.navigateTo(Routes.genderScreenView);
  }
}
