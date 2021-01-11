import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/services/local_storage.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../services/services/api_service.dart';

class RoleSelectViewModel extends BaseViewModel {
  // _________________________________________________________________________
  // Locating the Dependencies

  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final APIServices _apiServices = locator<APIServices>();
  final DialogService _dialogService = locator<DialogService>();
  // _________________________________________________________________________
  // Controllers and Variables
  int _role = 0;
  int get getRole => _role;
  // _________________________________________________________________________
  // Helper Functions
  void setRoleValue(int value) {
    _role = value;
  }

  void saveRoleType() async {
    var response = await _dialogService.showConfirmationDialog(
        title: "Do you want to continue ?",
        description:
            "This action will create a new account with mentioned role.",
        cancelTitle: "Cancel",
        confirmationTitle: "Continue",
        dialogPlatform: DialogPlatform.Custom);

    if (response.confirmed) {
      setBusy(true);
      // Set the role in the local storage and clear stacks
      await _storageService.setRoleType(_role);
      // Call the API to create clinic employee and save data
      await _apiServices.createClinicEmployee();
      setBusy(false);
      navigateTocreateOrSearchClinicScreenView();
    }
  }

// _________________________________________________________________________

  void navigateTocreateOrSearchClinicScreenView() => _navigatorService
      .clearStackAndShow(Routes.createOrSearchClinicScreenView);

  // _________________________________________________________________________
}
