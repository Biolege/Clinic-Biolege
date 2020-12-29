import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/services/local_storage.dart';
import '../app/locator.dart';
import '../app/router.gr.dart';
import '../services/services/auth_service.dart';
import '../model/clinic.dart';
import '../model/clinicEmployee.dart';

class RootViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final StorageService _storageService = locator<StorageService>();
  final Clinic _clinicDataService = locator<Clinic>();
  final ClinicEmployee _clinicEmployeeDataService = locator<ClinicEmployee>();

  // __________________________________________________________________________
  // Reroutes the user to either Emailscreenview or Onboarding Screen

  Future handleStartupLogic() async {
    var hasLoggedIn = await _authenticationService.isUserLoggedIn();
    // To be used when the user is filling up the detail and not yet created
    //  clinic and user
    await _storageService.initLocalStorages();
    // To be used when the user has filled all the data and is in homepage
    //  screens
    await _clinicDataService.initClinicData();
    await _clinicEmployeeDataService.initClinicEmployeeData();
    // ---------------------------------------------------------------------
    print("Phone       : " + _storageService.getPhoneNumber.toString());
    print("Name        : " + _storageService.getName.toString());
    print("Email       : " + _storageService.getEmailAddress.toString());
    print("DOB         : " + _storageService.getDateOfBirth.toString());
    print("Address     : " + _storageService.getAddress.toString());
    print("Role Type   : " + _storageService.getRoleType.toString());
    print("Clinic Type : " + _storageService.getClinicName.toString());

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
      else
        _navigatorService.clearStackAndShow(Routes.welcomeScreenView);
    } else
      _navigatorService.clearStackAndShow(Routes.onBoardingScreen);
  }
}
