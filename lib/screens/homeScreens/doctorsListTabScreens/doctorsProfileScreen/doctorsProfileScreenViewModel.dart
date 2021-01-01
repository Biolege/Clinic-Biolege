import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:clinicapp/model/doctor.dart';
import '../../../../app/locator.dart';
import '../../../../model/clinic.dart';
import '../../../../model/clinicEmployee.dart';
import '../../../../services/services/auth_service.dart';
import '../../../../services/services/dataFromApi_service.dart';
import '../../../../services/services/local_storage.dart';

class DoctorsProfileScreenViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final StorageService _storageService = locator<StorageService>();
  final Clinic _clinicDataService = locator<Clinic>();
  final ClinicEmployee _clinicEmployeeDataService = locator<ClinicEmployee>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________

}
