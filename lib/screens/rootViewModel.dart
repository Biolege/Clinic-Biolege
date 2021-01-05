import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/services/dataFromApi_service.dart';
import '../services/services/local_storage.dart';
import '../app/locator.dart';
import '../app/router.gr.dart';
import '../services/services/auth_service.dart';

class RootViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final StorageService _storageService = locator<StorageService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________
  // Reroutes the user to either Emailscreenview or Onboarding Screen

  Future handleStartupLogic() async {
    try {
      // ---------------------------------------------------------------------
      // Check whether user has logged in or not
      var hasLoggedIn = await _authenticationService.isUserLoggedIn();
      // ---------------------------------------------------------------------
      // To be used when the user is filling up the detail and not yet created
      //  clinic and user
      await _storageService.initLocalStorages();
      // To be used when the user has filled all the data and is in homepage
      //  screens
      await _dataFromApiService.setDoctorsList();
      // ---------------------------------------------------------------------
      print("Phone       : " + _storageService.getPhoneNumber.toString());
      print("Name        : " + _storageService.getName.toString());
      print("Email       : " + _storageService.getEmailAddress.toString());
      print("DOB         : " + _storageService.getDateOfBirth.toString());
      print("Address     : " + _storageService.getAddress.toString());
      print("Role Type   : " + _storageService.getRoleType.toString());
      print("Clinic Type : " + _storageService.getClinicName.toString());
      // ---------------------------------------------------------------------
      if (hasLoggedIn) {
        if (_storageService.getName == null)
          _navigatorService.clearStackAndShow(Routes.nameScreenView);
        else if (_storageService.getEmailAddress == null)
          _navigatorService.clearTillFirstAndShow(Routes.emailScreenView);
        else if (_storageService.getDateOfBirth == null)
          _navigatorService.clearTillFirstAndShow(Routes.genderScreenView);
        else if (_storageService.getAddress == null)
          _navigatorService.clearTillFirstAndShow(Routes.addressScreenView);
        else if (_storageService.getRoleType == null)
          _navigatorService.clearTillFirstAndShow(Routes.roleSelectScreenView);
        else if (_storageService.getClinicName == null ||
            _storageService.getClinicCityName == null ||
            _storageService.getClinicOwnerName == null)
          _navigatorService
              .clearStackAndShow(Routes.createOrSearchClinicScreenView);
        else {
          await _dataFromApiService.setDoctorsListForClinic();
          _navigatorService.clearStackAndShow(Routes.welcomeScreenView);
        }
      } else
        _navigatorService.clearStackAndShow(Routes.onBoardingScreen);
    } catch (e) {
      print("At Handle Startup Logic : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
    }
  }
}
