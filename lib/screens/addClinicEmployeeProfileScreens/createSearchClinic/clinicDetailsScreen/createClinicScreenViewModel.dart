import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';
import '../../../../services/services/local_storage.dart';
import '../../../../services/services/filePicker_service.dart';

class AddClinicViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final FilePickHelperService _filePickHelperService =
      locator<FilePickHelperService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________
  // Controller and Variables
  int _clinicLocationType = 0;

  File clinicLogo;

  Uint8List _selectedClinicLogo;
  Uint8List get getClinicLogo => _selectedClinicLogo;

  final createClinicForm = GlobalKey<FormState>();

  TextEditingController clinicName = TextEditingController();
  TextEditingController clinicPhoneNumber = TextEditingController();
  TextEditingController clinicAddress = TextEditingController();
  // _________________________________________________________________________
  // Validators
  String validateClinicName(String value) {
    return value.isEmpty
        ? "Clinic name cannot be empty"
        : value.length > 4
            ? null
            : "Clinic name should be atleast 5 characters long";
  }

  String validateClinicPhoneNumber(String value) {
    // /^\+(91)[6-9]\d{9}$/g
    return value.isEmpty
        ? "Phone number cannot be empty"
        : value.length == 10
            ? null
            : "Phone number should be 10 digits";
  }

  String validateClinicLogo(File file) {
    // Checks if the size the more than 3 Mb
    if (file.lengthSync() > 3000000) {
      _snackBarService.showSnackbar(message: "Image must be of less than 3 Mb");
      return null;
    } else
      return "Success";
  }

  // _________________________________________________________________________
  // Helper functions
  void setClinicTypeValue(int value) {
    _clinicLocationType = value;
    print(_clinicLocationType);
  }

  void pickClinicLogo() async {
    // Starts the picking process
    var image = await _filePickHelperService.pickImage(ImageSource.gallery);

    // Validate the incoming filesize
    if (validateClinicLogo(File(image.path)) == null) return;
    _selectedClinicLogo = File(image.path).readAsBytesSync();
    notifyListeners();
  }

  // _________________________________________________________________________
  // Saving Clinic details
  void saveClinicDetails() async {
    createClinicForm.currentState.save();

    if (!createClinicForm.currentState.validate()) return;

    if (_selectedClinicLogo == null) {
      _snackBarService.showSnackbar(message: "Please upload a clinic logo");
      return;
    }
    // Sets the value in Local Storage
    await _storageService.setClinicDetails(
        clinicName: clinicName.text,
        clinicPhone: int.parse(clinicPhoneNumber.text),
        clinicLogo: String.fromCharCodes(_selectedClinicLogo),
        clinicLocationType: _clinicLocationType);
    // Next Page
    navigateToAddClinicDescriptionView();
  }

  void navigateToAddClinicDescriptionView() {
    _navigatorService.navigateTo(Routes.addClinicDescriptionScreenView);
  }
  // _________________________________________________________________________
}
