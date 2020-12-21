import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class CustomerDoctorSelectionScreenViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  void selectTimeAndDate() {
    _navigatorService.navigateTo(Routes.timeAndDateSelectionScreenView);
  }
}
