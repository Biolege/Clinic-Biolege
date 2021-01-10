import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../services/services/dataFromApi_service.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';
import '../../../../services/services/helperData_service.dart';

class ConfirmScreenViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DoctorAppointments _doctorAppointmentsDetailService =
      locator<DoctorAppointments>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  // __________________________________________________________________________

  void confirmedAddition() async {
    setBusy(true);
    _doctorAppointmentsDetailService.setDefaultSelectedDoctor();
    // Get all the doctors in the beginning itself
    await _dataFromApiService.setDoctorsList();
    // Get all the diagnotic customer in the beginning itself
    await _dataFromApiService.setDiagnosticCustomersList();
    await _dataFromApiService.setDoctorsListForClinic();

    setBusy(false);
    _navigatorService.pushNamedAndRemoveUntil(Routes.homeScreenView,
        predicate: (route) => false);
  }
}
