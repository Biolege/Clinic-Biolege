import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/services/local_storage.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../services/services/auth_service.dart';

class CreateOrSearchClinicViewModel extends BaseViewModel {
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  // __________________________________________________________________________

  int _roleType;
  int get getRoleType => _roleType;

  String logo = "asset/images/logo.png";

  void navigateToSeachClinicView() async {
    // _authenticationService.signOut();
    _navigatorService.navigateTo(Routes.searchClinicScreenView);
  }

  void navigateToAddClinicView() {
    _navigatorService.navigateTo(Routes.addClinicScreenView);
  }

  void setRoleType() {
    _roleType = _storageService.getRoleType;
    notifyListeners();
  }
}
