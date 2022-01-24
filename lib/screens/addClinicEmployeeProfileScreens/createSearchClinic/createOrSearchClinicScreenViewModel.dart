import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/services/local_storage.dart';
import '../../../app/locator.dart';
import '../../../app/router.router.dart';
// import '../../../services/services/api_service.dart';
// import '../../../services/services/auth_service.dart';

class CreateOrSearchClinicViewModel extends BaseViewModel {
  // ___________________________________________________________________________
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // final APIServices _apiServices = locator<APIServices>();
  // ___________________________________________________________________________
  // Controller and Variables
  int _roleType;
  int get getRoleType => _roleType;
  // ___________________________________________________________________________
  // Helper Functions

  void navigateToSeachClinicView() async {
    // _authenticationService.signOut();
    _navigatorService.navigateTo(Routes.searchClinicScreenView);
  }

  void setRoleType() {
    _roleType = _storageService.getRoleType;
    notifyListeners();
  }
  // ___________________________________________________________________________

  void navigateToAddClinicView() {
    _navigatorService.navigateTo(Routes.addClinicScreenView);
  }
}
