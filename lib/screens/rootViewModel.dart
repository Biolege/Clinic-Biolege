import 'package:clinicapp/app/locator.dart';
import 'package:clinicapp/app/router.gr.dart';
import 'package:clinicapp/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RootViewModel extends BaseViewModel {
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  // __________________________________________________________________________

  Future handleStartupLogic() async {
    var hasLoggedIn = await _authenticationService.isUserLoggedIn();

    if (hasLoggedIn)
      _navigatorService.navigateTo(Routes.emailScreenView);
    else
      _navigatorService.navigateTo(Routes.onBoardingScreen);
  }
}
