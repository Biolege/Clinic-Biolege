import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/services/local_storage.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class RoleSelectViewModel extends BaseViewModel {
  // _________________________________________________________________________
  // Locating the Dependencies

  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  // _________________________________________________________________________
  // Controllers and Variables
  int _role = 0;
  // _________________________________________________________________________
  void setRoleValue(int value) {
    _role = value;
  }

  void saveRoleType() async {
    await _storageService.setRoleType(_role);
    navigateTocreateOrSearchClinicScreenView();
  }

  void navigateTocreateOrSearchClinicScreenView() {
    _navigatorService.navigateTo(Routes.createOrSearchClinicScreenView);
  }
}
