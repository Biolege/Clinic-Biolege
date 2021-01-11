import 'dart:typed_data';

import 'package:clinicapp/model/clinic.dart';
import 'package:clinicapp/model/clinicEmployee.dart';
import 'package:clinicapp/services/services/dataFromApi_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/locator.dart';
import '../../../../services/services/local_storage.dart';
import '../../../../services/services/filePicker_service.dart';

class EmployeeProfileScreenViewModel extends FutureViewModel {
// __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final FilePickHelperService _filePickHelperService =
      locator<FilePickHelperService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();

  // __________________________________________________________________________
  // Variables
  ClinicEmployee _employee;
  ClinicEmployee get getEmployee => _employee;

  String _employeeEmail;
  String get getEmployeeEmail => _employeeEmail;

  String _roleType;
  String get getRoleType => _roleType;

  // Uint8List _employeeImageToDisplay;
  // Uint8List get getEmployeeImageToShow => _employeeImageToDisplay;

  // __________________________________________________________________________
  @override
  Future futureToRun() async {
    try {
      _employee = _dataFromApiService.getClinicEmployee;
      _employeeEmail = _storageService.getEmailAddress;
      _roleType = _employee.role == 0
          ? "Owner"
          : (_storageService.getRoleType == 1)
              ? "Staff Member"
              : "Receiptionist";
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError();
  }
}
