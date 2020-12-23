import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../services/services/local_storage.dart';

class GenderViewModel extends BaseViewModel {
  // _________________________________________________________________________
  // Locating the Dependencies

  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();

  // _________________________________________________________________________
  // Controllers and Variables

  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  final genderFormKey = GlobalKey<FormState>();

  String _genderValue = "MALE";

  DateFormat formatter = DateFormat('dd-MM-yyyy');
  DateTime _firstDate = DateTime.now();
  DateTime _lastDate = DateTime.now();
  DateTime _selectedDOB;

  DateTime get getFirstDate => _firstDate;
  DateTime get getLastDate => _lastDate;
  DateTime get getselectedDate => _selectedDOB;
  String get getGenderValue => _genderValue;
  // _________________________________________________________________________
  void setGenderValue(String value) {
    _genderValue = value;
  }

// _________________________________________________________________________
// DOB picker
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

// _________________________________________________________________________
// Validate Date
  String validateDate() {
    print(_selectedDOB);
    return _selectedDOB != null ? null : "Choose a date";
  }

  // _________________________________________________________________________
  // Saving DOB and Gender
  void saveDobAndGender() async {
    genderFormKey.currentState.save();
    if (!genderFormKey.currentState.validate()) return;
    print(_selectedDOB.toIso8601String());
    await _storageService
        .setGenderAndDateOfBirth(
            dob: _selectedDOB.toString(), gender: _genderValue)
        .whenComplete(() => navigateToAddressView());
  }

  void navigateToAddressView() {
    _navigatorService.navigateTo(Routes.addressScreenView);
  }
  // _________________________________________________________________________
}
