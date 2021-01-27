import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../services/services/filePicker_service.dart';
import '../services/services/auth_service.dart';
import '../services/services/local_storage.dart';
import '../services/services/api_service.dart';
import '../services/services/dataFromApi_service.dart';
import '../services/services/helperData_service.dart';

final locator = GetIt.instance;

@injectable
void setupLocator() {
  // Services
  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => APIServices());
  locator.registerLazySingleton(() => FilePickHelperService());
  locator.registerLazySingleton(() => BottomSheetService());
  // Data
  locator.registerLazySingleton(() => DataFromApi());
  // Helper Data Service (Data inside these classes changes)
  locator.registerLazySingleton(() => PatientDetails());
  locator.registerLazySingleton(() => DoctorAppointments());
}
