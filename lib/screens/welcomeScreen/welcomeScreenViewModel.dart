import '../../services/services/helperData_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import '../../services/services/local_storage.dart';
import '../../app/locator.dart';
import '../../app/router.gr.dart';

// import '../../services/services/auth_service.dart';
// import '../../model/clinic.dart';
// import '../../model/clinicEmployee.dart';
import '../../services/services/dataFromApi_service.dart';

// import '../../services/services/api_service.dart';
class WelcomeScreenViewModel extends FutureViewModel<Map<String, String>> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // final StorageService _storageService = locator<StorageService>();
  // final Clinic _clinicDataService = locator<Clinic>();
  // final APIServices _apiServices = locator<APIServices>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  final DoctorAppointments _doctorAppointmentsDetailService =
      locator<DoctorAppointments>();
  // __________________________________________________________________________
  // Streams/Futures
  @override
  Future<Map<String, String>> futureToRun() async {
    try {
      return {
        "clinicEmployeeName": _dataFromApiService.getClinicEmployee.name,
        "clinicName": _dataFromApiService.getClinic.name,
        "designation": (_dataFromApiService.getClinicEmployee.role == 0)
            ? "Owner"
            : (_dataFromApiService.getClinicEmployee.role == 1)
                ? "Staff Member"
                : "Receiptionist"
      };
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError("Error occured on the welcome screen");
  }
  // __________________________________________________________________________

  void navigateToHomePageView() {
    _doctorAppointmentsDetailService.setDefaultSelectedDoctor();
    _navigatorService.navigateTo(Routes.homeScreenView);
  }
  // __________________________________________________________________________
}
