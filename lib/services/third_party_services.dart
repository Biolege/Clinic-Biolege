import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'services/dataFromApi_service.dart';
import 'services/filePicker_service.dart';
import 'services/api_service.dart';
import 'services/auth_service.dart';
import 'services/helperData_service.dart';
import 'services/local_storage.dart';
// import '../model/clinicEmployee.dart';
// import '../model/clinic.dart';

abstract class ThirdPartyServicesModule {
  @lazySingleton
  // __________________________________________________________________________
  // ---------------------------------------------------
  // Data Services
  // ---------------------------------------------------
  DataFromApi get dataFromApi;
  StorageService get localStorageService;
  PatientDetails get patientDetailservice;
  DoctorAppointments get doctorAppointmentsDetailservice;
  // ---------------------------------------------------
  // Navigation Services
  NavigationService get navigationService;
  // ---------------------------------------------------
  // Theme Services
  // ---------------------------------------------------
  ThemeService get themeService;
  // ---------------------------------------------------
  // Authentication Services
  // ---------------------------------------------------
  AuthenticationService get authenticationService;
  // ---------------------------------------------------
  // Utility Services
  // ---------------------------------------------------
  APIServices get aPIServices;
  DialogService get dialogService;
  SnackbarService get snackbarService;
  FilePickHelperService get filePickHelperService;
  // ---------------------------------------------------
  // __________________________________________________________________________
}
