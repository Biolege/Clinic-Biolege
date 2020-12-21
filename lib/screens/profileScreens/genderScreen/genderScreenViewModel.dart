import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class GenderViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  GlobalKey genderFormKey = GlobalKey<FormState>();

  String logo = "asset/images/logo.png";
  String _genderValue = "MALE";

  DateFormat formatter = DateFormat('dd-MM-yyyy');
  DateTime _firstDate = DateTime.now();
  DateTime _lastDate = DateTime.now();
  DateTime _selectedDOB;

  DateTime get getFirstDate => _firstDate;
  DateTime get getLastDate => _lastDate;
  DateTime get getselectedDate => _selectedDOB;
  String get getGenderValue => _genderValue;

  void setGenderValue(String value) {
    _genderValue = value;
  }

  void selectAssignedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDOB != null ? _selectedDOB : DateTime.now(),
        firstDate: DateTime(1950, 1),
        lastDate: DateTime.now());

    if (picked != null && picked != _selectedDOB) {
      _selectedDOB = picked;
      dob.text = formatter.format(_selectedDOB);
    }

    FocusScope.of(context).requestFocus(new FocusNode());
    notifyListeners();
  }

  void navigateToAddressView() {
    _navigatorService.navigateTo(Routes.addressScreenView);
  }
}
