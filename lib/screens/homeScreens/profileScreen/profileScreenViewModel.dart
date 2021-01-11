import 'dart:typed_data';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../services/services/local_storage.dart';
import '../../../app/router.gr.dart';
import '../../../services/services/auth_service.dart';

import '../../../services/services/filePicker_service.dart';

// import '../../../services/services/helperData_service.dart';
class ProfileScreenViewModel extends FutureViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final StorageService _storageService = locator<StorageService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final FilePickHelperService _filePickHelperService =
      locator<FilePickHelperService>();
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  // final DoctorAppointments _doctorAppointmentsDetailservice =
  //     locator<DoctorAppointments>();

  // final Clinic _clinicDataService = locator<Clinic>();
  // final ClinicEmployee _clinicEmployeeDataService = locator<ClinicEmployee>();
  // final DataFromApi _dataFromApiService = locator<DataFromApi>();

  // __________________________________________________________________________
  // Variables
  String _clinicName;
  String get getClinicName => _clinicName;
  String _clinicLogo;
  Uint8List _clinicLogoToDisplay;
  Uint8List get getClinicLogoToShow => _clinicLogoToDisplay;
// __________________________________________________________________________
  void openClinicDetails() =>
      _navigatorService.navigateTo(Routes.clinicProfileScreenView);

  void openClinicEmployeeDetails() =>
      _navigatorService.navigateTo(Routes.employeeProfileScreenView);

  void logOut() async {
    var response = await _dialogService.showConfirmationDialog(
        title: "Do you want to log out ?",
        description: "",
        cancelTitle: "Cancel",
        confirmationTitle: "Continue",
        dialogPlatform: DialogPlatform.Custom);

    if (response.confirmed) {
      _authenticationService.signOut();
    }
  }

  // __________________________________________________________________________
  @override
  Future futureToRun() async {
    try {
      _clinicName = _storageService.getClinicName;
      _clinicLogo = _storageService.getClinicLogo;
      _clinicLogoToDisplay =
          _filePickHelperService.dataFromBase64String(_clinicLogo);
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError();
  }
}
