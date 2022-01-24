import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.router.dart';
import '../../../../model/doctor.dart';
import '../../../../services/services/api_service.dart';
import '../../../../services/services/helperData_service.dart';
// import '../../../../model/clinic.dart';
// import '../../../../model/clinicEmployee.dart';
// import '../../../../services/services/auth_service.dart';
// import '../../../../services/services/dataFromApi_service.dart';
// import '../../../../services/services/local_storage.dart';

class DoctorsProfileScreenViewModel extends FutureViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final APIServices _apiServices = locator<APIServices>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DoctorAppointments _doctorAppointmentsDetailservice =
      locator<DoctorAppointments>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // final StorageService _storageService = locator<StorageService>();
  // final Clinic _clinicDataService = locator<Clinic>();
  // final ClinicEmployee _clinicEmployeeDataService = locator<ClinicEmployee>();
  // final DataFromApi _dataFromApiService = locator<DataFromApi>();
  // __________________________________________________________________________
  // Variables
  Doctor _selectedDoctorToShow;
  Doctor get getSelectedDoctorToShow => _selectedDoctorToShow;
  ClinicElement _clinicDetailsForSelectedDoctorToShow;
  ClinicElement get getClinicDetailsForSelectedDoctorToShow =>
      _clinicDetailsForSelectedDoctorToShow;
  bool _isFromClinic;
  bool get getIsFromClinic => _isFromClinic;

  bool isWorking = false;
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
      isWorking = true;
      notifyListeners();
      await _apiServices.addOrUpdateClinicToDoctorById(docId);
      isWorking = false;
      notifyListeners();
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

  @override
  Future futureToRun() async {
    try {
      _selectedDoctorToShow =
          _doctorAppointmentsDetailservice.getSelectedDoctorToShow;
      _clinicDetailsForSelectedDoctorToShow = _doctorAppointmentsDetailservice
          .getClinicDetailsForSelectedDoctorToShow;
      _isFromClinic = _doctorAppointmentsDetailservice.getIsFromClinic;
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError();
  }
  // __________________________________________________________________________

}
