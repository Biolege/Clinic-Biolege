import '../../app/locator.dart';
import '../../app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardingViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  void navigateToPhoneNumberScreen() {
    _navigatorService.navigateTo(Routes.phoneScreenView);
  }
}
