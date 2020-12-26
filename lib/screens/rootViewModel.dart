import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/services/local_storage.dart';
import '../app/locator.dart';
import '../app/router.gr.dart';
import '../services/services/auth_service.dart';

class RootViewModel extends BaseViewModel {
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final StorageService _storageService = locator<StorageService>();
  // __________________________________________________________________________
  // Reroutes the user to either EmailScreenView or OnBoarding Screen

  Future handleStartupLogic() async {
    var hasLoggedIn = await _authenticationService.isUserLoggedIn();

    print(_storageService.getName);
    print(_storageService.getEmailAddress);
    print(_storageService.getDateOfBirth);
    print(_storageService.getAddress);
    print(_storageService.getRoleType);
    print(_storageService.getClinicName);

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
      else
        _navigatorService
            .clearStackAndShow(Routes.createOrSearchClinicScreenView);
    } else
      _navigatorService.clearStackAndShow(Routes.onBoardingScreen);
  }
}
