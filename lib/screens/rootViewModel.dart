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
    if (hasLoggedIn) {
      if (_storageService.getName == null)
        _navigatorService.clearStackAndShow(Routes.nameScreenView);
      if (_storageService.getEmailAddress == null)
        _navigatorService.clearStackAndShow(Routes.emailScreenView);
      if (_storageService.getDateOfBirth == null)
        _navigatorService.clearStackAndShow(Routes.genderScreenView);
      if (_storageService.getAddress == null)
        _navigatorService.clearStackAndShow(Routes.addressScreenView);
      if (_storageService.getRoleType == null)
        _navigatorService.clearStackAndShow(Routes.roleSelectScreenView);
      if (_storageService.getClinicName == null)
        _navigatorService
            .clearStackAndShow(Routes.createOrSearchClinicScreenView);
    } else
      _navigatorService.clearStackAndShow(Routes.onBoardingScreen);
  }
}
