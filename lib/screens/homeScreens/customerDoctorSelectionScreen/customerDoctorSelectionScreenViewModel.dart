import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../model/doctor.dart';
import '../../../services/services/api_service.dart';
import '../../../services/services/dataFromApi_service.dart';
import '../../../services/services/local_storage.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class CustomerDoctorSelectionScreenViewModel
    extends FutureViewModel<List<Doctor>> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final APIServices _apiServices = locator<APIServices>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________
  void selectTimeAndDate() =>
      _navigatorService.navigateTo(Routes.timeAndDateSelectionScreenView);

  @override
  Future<List<Doctor>> futureToRun() async {
    try {
      var x = _dataFromApiService.getDoctorsListForClinic;
      return x;
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
      throw UnimplementedError();
    }
  }
}
