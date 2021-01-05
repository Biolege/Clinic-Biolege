import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../services/services/local_storage.dart';
import '../../services/services/auth_service.dart';
import '../../app/locator.dart';
import '../../app/router.gr.dart';

// import '../../model/clinic.dart';
// import '../../model/clinicEmployee.dart';
// import '../../services/services/dataFromApi_service.dart';
// import '../../services/services/api_service.dart';
class WelcomeScreenViewModel extends FutureViewModel<Map<String, String>> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final StorageService _storageService = locator<StorageService>();
  // final Clinic _clinicDataService = locator<Clinic>();
  // final APIServices _apiServices = locator<APIServices>();
  // final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // __________________________________________________________________________
  // Streams/Futures
  @override
  Future<Map<String, String>> futureToRun() async {
    try {
      return {
        "clinicEmployeeName": _storageService.getName,
        "clinicName": _storageService.getClinicName,
        "roleType": _storageService.getRoleType.toString(),
        "designation": (_storageService.getRoleType == 0)
            ? "Owner"
            : (_storageService.getRoleType == 1)
                ? "Staff Member"
                : "Receiptionist"
      };
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError("Error occured on the welcome screen");
  }
  // __________________________________________________________________________

  void navigateToHomePageView() =>
      // _authenticationService.signOut();
      _navigatorService.navigateTo(Routes.homeScreenView);
  // __________________________________________________________________________
}
