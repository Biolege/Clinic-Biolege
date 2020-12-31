import 'package:clinicapp/services/services/dataFromApi_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../services/services/api_service.dart';
import '../../services/services/local_storage.dart';
import '../../services/services/auth_service.dart';
import '../../app/locator.dart';
import '../../app/router.gr.dart';
import '../../model/clinic.dart';
import '../../model/clinicEmployee.dart';

class WelcomeScreenViewModel extends FutureViewModel<Map<String, String>> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final ClinicEmployee _clinicEmployeeDataService = locator<ClinicEmployee>();
  final Clinic _clinicDataService = locator<Clinic>();
  final APIServices _apiServices = locator<APIServices>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // __________________________________________________________________________
  // Getters for the UI
  String _clinicEmployeeName;
  String getClinicEmployeeName() => _clinicEmployeeName;
  String _clinicName;
  String getClinicName() => _clinicName;
  int _roleType;
  int get getRoleType => _roleType;
  String _designation;
  String getDesignation() => _designation;

  // __________________________________________________________________________
  // Streams/Futures
  @override
  Future<Map<String, String>> futureToRun() async {
    try {
      _clinicEmployeeName = _clinicEmployeeDataService.name;
      _clinicName = _clinicDataService.name;
      _roleType = _clinicEmployeeDataService.role;
      _designation = _clinicEmployeeDataService.role == 0
          ? "Owner"
          : _clinicEmployeeDataService.role == 1
              ? "Staff Member"
              : "Receiptionist";
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError("Error occured on the welcome screen");
  }
  // __________________________________________________________________________

  void navigateToHomePageView() async {
    // _dataFromApiService.setDoctorsList();
    // await _apiServices.getAllDoctors();
    // // _authenticationService.signOut();
    // // _apiServices.getAllDoctors();
    _navigatorService.navigateTo(Routes.homeScreenView);
  }
}
