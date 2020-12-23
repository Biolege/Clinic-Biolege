import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class CreateOrSearchClinicViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  String logo = "asset/images/logo.png";

  void navigateToSeachClinicView() {
    _navigatorService.navigateTo(Routes.searchClinicScreenView);
  }

  void navigateToAddClinicView() {
    _navigatorService.navigateTo(Routes.createClinicScreenView);
  }
}
