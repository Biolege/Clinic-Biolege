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

class AddClinicDescriptionViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final FilePickHelperService _filePickHelperService =
      locator<FilePickHelperService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________
  // Controllers and Variables
  Uint8List _selectedClinicAddressProof;
  Uint8List get getClinicAddressProof => _selectedClinicAddressProof;
  final clinicDesciptionFormKey = GlobalKey<FormState>();
  TextEditingController clinicStateName = TextEditingController();
  TextEditingController clinicCityName = TextEditingController();
  TextEditingController clinicAddress = TextEditingController();
  TextEditingController clinicPincode = TextEditingController();
  // __________________________________________________________________________
  // Validators

  String validateClinicStateName(String value) {
    return value.isEmpty
        ? "Clinic state name cannot be empty"
        : value.length > 1
            ? null
            : "Clinic state name should be atleast 2 characters long";
  }

  String validateClinicCityName(String value) {
    return value.isEmpty
        ? "Clinic city name cannot be empty"
        : value.length > 3
            ? null
            : "Clinic city name should be atleast 4 characters long";
  }

  String validateClinicCityAddress(String value) {
    return value.isEmpty
        ? "Clinic address cannot be empty"
        : value.length > 9
            ? null
            : "Clinic address should be atleast 10 characters long";
  }

  String validateClinicPincode(String value) {
    int pinC = value.isEmpty ? 0 : int.parse(value);
    return pinC == 0
        ? "Pincode cannot be empty"
        : value.length == 6
            ? null
            : "Pincode should be of 6 digit";
  }

  String validateAddressProofFile(File file) {
    // Checks if the size the more than 3 Mb
    if (file.lengthSync() > 3000000) {
      _snackBarService.showSnackbar(message: "Image must be of less than 3 Mb");
      return null;
    } else
      return "Success";
  }

  // _________________________________________________________________________
  // Helper functions

  void pickClinicAddressProof() async {
    // Starts the picking process
    var image = await _filePickHelperService.pickImage(ImageSource.gallery);

    // Validate the incoming filesize
    if (validateAddressProofFile(File(image.path)) == null) return;
    _selectedClinicAddressProof = File(image.path).readAsBytesSync();
    notifyListeners();
  }

  // _________________________________________________________________________
  // Saving Clinic description
  void saveClinicDescription() async {
    clinicDesciptionFormKey.currentState.save();
    if (!clinicDesciptionFormKey.currentState.validate()) return;
    // Sets the value in Local Storage
    await _storageService.setClinicDescription(
      clinicStateName: clinicStateName.text,
      clinicCityName: clinicCityName.text,
      clinicAddress: clinicAddress.text,
    );
    // Next Page
    navigateToClinicOwnerDetails();
  }

  void navigateToClinicOwnerDetails() {
    _navigatorService.navigateTo(
      Routes.addClinicOwnerDetailsScreenView,
    );
  }
}
