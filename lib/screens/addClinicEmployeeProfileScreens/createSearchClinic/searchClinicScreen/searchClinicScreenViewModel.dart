import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/router.gr.dart';
import '../../../../app/locator.dart';
import '../../../../model/clinic.dart';
import '../../../../services/services/dataFromApi_service.dart';
// import '../../../../services/services/api_service.dart';
// import '../../../../services/services/auth_service.dart';
// import '../../../../services/services/local_storage.dart';

class SearchClinicViewModel extends FutureViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigatorService = locator<NavigationService>();
  // final APIServices _apiServices = locator<APIServices>();

  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // final StorageService _storageService = locator<StorageService>();
  // __________________________________________________________________________
  // Variables and Controller
  TextEditingController search = TextEditingController();
  List<Clinic> allClinic;
  List<Clinic> results = [];

  void searchClinic() {
    results.clear();
    allClinic
        .where((clinic) =>
            clinic.name.toLowerCase().contains(search.text.toLowerCase()))
        .forEach((clinic) => results.add(clinic));

    if (search.text.length == 0) results.clear();

    notifyListeners();
  }

  void setClinicForEmployee(Clinic clc) async {
    DialogResponse response = await _dialogService.showConfirmationDialog(
        title: "Do you want to continue ?",
        description:
            "This will add/update clinic to your profile and by clicking on continue, you are agreeing to our terms of use & privacy policy",
        cancelTitle: "Cancel",
        confirmationTitle: "Continue",
        dialogPlatform: DialogPlatform.Custom);

    if (response.confirmed) {
      setBusy(true);
      await _dataFromApiService.saveClinicForEmployeeINIT(clc.id);
      setBusy(false);
      navigateToWelcomeScreen();
    }
  }

  // ___________________________________________________________________________
  void navigateToWelcomeScreen() {
    _navigatorService.pushNamedAndRemoveUntil(Routes.root,
        predicate: (route) => false);
  }
  // ___________________________________________________________________________

  @override
  Future futureToRun() async {
    try {
      setBusy(true);
      allClinic = _dataFromApiService.getAllClinics;
      setBusy(false);
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError();
  }
}
