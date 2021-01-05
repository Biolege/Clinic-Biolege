import '../../../../app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../model/doctor.dart';
import '../../../../screens/homeScreens/doctorsListTabScreens/doctorsProfileScreen/doctorsProfileScreenView.dart';
import '../../../../app/locator.dart';
import '../../../../services/services/dataFromApi_service.dart';
// import '../../../../model/clinic.dart';
// import '../../../../model/clinicEmployee.dart';
// import '../../../../services/services/auth_service.dart';
// import '../../../../services/services/local_storage.dart';

class DoctorsListScreenViewModel extends FutureViewModel<List<Doctor>> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // final StorageService _storageService = locator<StorageService>();
  // final Clinic _clinicDataService = locator<Clinic>();
  // final ClinicEmployee _clinicEmployeeDataService = locator<ClinicEmployee>();

  // __________________________________________________________________________
  // Helper functions

  // __________________________________________________________________________
  void profileDescriptionView(Doctor doctor) async {
    ClinicElement detailsForTheClinicOfDoctor =
        _dataFromApiService.getClinicDetailsOfDoctor[doctor.id];
    _navigatorService.navigateToView(DoctorsProfileScreenView(
      doctor: doctor,
      clinicDetails: detailsForTheClinicOfDoctor,
      isFromClinic: true,
    ));
  }

  void navigateToAddDoctorToClinicScreen() {
    _navigatorService.navigateTo(Routes.selectDoctorClinicScreen);
  }

  @override
  Future<List<Doctor>> futureToRun() async {
    try {
      var x = _dataFromApiService.getDoctorsListForClinic;
      return x;
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
      throw UnimplementedError();
    }
  }
}
