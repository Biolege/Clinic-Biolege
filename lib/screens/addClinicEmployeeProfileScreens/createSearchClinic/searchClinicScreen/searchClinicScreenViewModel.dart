import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../model/clinic.dart';
import '../../../../services/services/dataFromApi_service.dart';
// import '../../../../services/services/auth_service.dart';
// import '../../../../services/services/local_storage.dart';

class SearchClinicViewModel extends FutureViewModel<List<Clinic>> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // final NavigationService _navigatorService = locator<NavigationService>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // final StorageService _storageService = locator<StorageService>();
  // __________________________________________________________________________
  TextEditingController search = TextEditingController();

  @override
  Future<List<Clinic>> futureToRun() async {
    try {
      return _dataFromApiService.getAllClinics;
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
