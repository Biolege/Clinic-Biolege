import 'package:clinicapp/app/router.gr.dart';
import 'package:clinicapp/services/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
// import '../../../../model/clinic.dart';
// import '../../../../model/clinicEmployee.dart';
// import '../../../../services/services/auth_service.dart';
// import '../../../../services/services/dataFromApi_service.dart';
// import '../../../../services/services/local_storage.dart';

class DoctorsProfileScreenViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final APIServices _apiServices = locator<APIServices>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // final StorageService _storageService = locator<StorageService>();
  // final Clinic _clinicDataService = locator<Clinic>();
  // final ClinicEmployee _clinicEmployeeDataService = locator<ClinicEmployee>();
  // final DataFromApi _dataFromApiService = locator<DataFromApi>();

  // __________________________________________________________________________
  // Helper Functions
  void addThisDoctorToClinc(String docName, String docId) async {
    // Prompt for confirmation
    DialogResponse res = await _dialogService.showConfirmationDialog(
        description: "Do you want to add " + docName + " to your clinic ?",
        cancelTitle: "Cancel",
        confirmationTitle: "Continue",
        title: "Confirm");
    // If user pressed continue then perform the API call
    if (res.confirmed == true) {
      setBusy(true);
      await _apiServices.addClinicToDoctorById(docId);
      setBusy(false);
      goBackToHome(docName);
    }
  }
  // __________________________________________________________________________

  void goBackToHome(String docName) {
    _navigatorService.pushNamedAndRemoveUntil(Routes.homeScreenView,
        predicate: ModalRoute.withName(Routes.welcomeScreenView));
    _snackBarService.showSnackbar(
        message: docName + " was added to your clinic");
  }
  // __________________________________________________________________________

}
