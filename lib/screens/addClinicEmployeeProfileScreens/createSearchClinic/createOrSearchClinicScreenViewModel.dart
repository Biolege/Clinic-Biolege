import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/services/local_storage.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class CreateOrSearchClinicViewModel extends BaseViewModel {
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  // __________________________________________________________________________

  String logo = "asset/images/logo.png";

  void navigateToSeachClinicView() async {
    var val = _storageService.getName;
    print(val);
    // _navigatorService.navigateTo(Routes.searchClinicScreenView);
  }

  void navigateToAddClinicView() {
    _navigatorService.navigateTo(Routes.createClinicScreenView);
  }
}
