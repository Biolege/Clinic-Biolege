import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class AddBiolegeScreenViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  GlobalKey<FormState> biolegeCardForm = GlobalKey<FormState>();
  TextEditingController biolegeCardNumber = TextEditingController();
  void addCustomerName() {
    _navigatorService.navigateTo(Routes.addBiolegeCardAddNameScreenView);
  }
}
