import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/locator.dart';
import '../app/router.gr.dart';
import '../services/auth_service.dart';

class RootViewModel extends BaseViewModel {
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // __________________________________________________________________________
  // Reroutes the user to either EmailScreenView or OnBoarding Screen

  Future handleStartupLogic() async {
    var hasLoggedIn = await _authenticationService.isUserLoggedIn();

    if (hasLoggedIn)
      _navigatorService.navigateTo(Routes.emailScreenView);
    else
      _navigatorService.navigateTo(Routes.onBoardingScreen);
  }
}
