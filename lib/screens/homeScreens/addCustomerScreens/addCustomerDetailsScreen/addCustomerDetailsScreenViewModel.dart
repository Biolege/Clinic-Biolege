import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../services/services/helperData_service.dart';
import '../../../../app/router.gr.dart';

class AddCustomerDetailsScreenViewModel extends BaseViewModel {
  // _________________________________________________________________________
  // Locating the Dependencies

  final NavigationService _navigatorService = locator<NavigationService>();
  final PatientDetails _patientDetailsService = locator<PatientDetails>();

  // _________________________________________________________________________
  // Controllers and Variables

  TextEditingController dob = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  TextEditingController age = TextEditingController();
  final customerDetailsFormKey = GlobalKey<FormState>();

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
// Validators

  String validateDate() {
    print(_selectedDOB);
    return _selectedDOB != null ? null : "Choose a date";
  }

  String validateBloodGroup(String bg) {
    return bg != null ? null : "Blood Group cannot be empty";
  }

  String validateAge(String age) {
    return age == null
        ? "Age cannot be empty"
        : age == "0"
            ? "Age cannot be 0"
            : null;
  }

  // _________________________________________________________________________
  // Saving DOB and Gender
  void saveCustomerDetails() async {
    customerDetailsFormKey.currentState.save();
    if (!customerDetailsFormKey.currentState.validate()) return;

    print(_genderValue + bloodGroup.text + age.text);

    _patientDetailsService.setDoctorsPatientGender(_genderValue);
    _patientDetailsService.setDoctorsPatientDob(_selectedDOB);
    _patientDetailsService.setDoctorsPatientBloodGroup(bloodGroup.text);
    _patientDetailsService.setDoctorsPatientAge(int.parse(age.text));

    navigateToAddCustomerAddress();
  }

  void navigateToAddCustomerAddress() {
    _navigatorService.navigateTo(Routes.addCustomerAddressScreenView);
  }
  // _________________________________________________________________________
}
