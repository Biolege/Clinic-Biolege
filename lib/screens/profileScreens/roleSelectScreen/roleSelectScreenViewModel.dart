import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class RoleSelectViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();
  String _role = "ADMIN";
  String logo = "asset/images/logo.png";

  void setRoleValue(String value) {
    _role = value;
    print(_role);
  }

  void navigateTocreateOrSearchClinicScreenView() {
    _navigatorService.navigateTo(Routes.createOrSearchClinicScreenView);
  }
}
