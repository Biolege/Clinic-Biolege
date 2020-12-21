import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class ConfirmScreenViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  void confirmedAddition() {
    _navigatorService.pushNamedAndRemoveUntil(Routes.homeScreenView,
        predicate: (route) => false);
  }
}
