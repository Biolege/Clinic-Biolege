import 'package:clinicapp/screens/homeScreens/addCustomerScreens/timeAndDateSelectionScreen/timeAndDateSelectionScreenView.dart';
import 'package:clinicapp/services/services/helperData_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../model/doctor.dart';
import '../../../services/services/dataFromApi_service.dart';
import '../../../app/locator.dart';

class CustomerDoctorSelectionScreenViewModel
    extends FutureViewModel<List<Doctor>> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final PatientDetails _patientDetailService = locator<PatientDetails>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________
  void setTimeAndDateForAppointment(Doctor doctor) {
    ClinicElement detailsForTheClinicOfDoctor =
        _dataFromApiService.getClinicDetailsOfDoctor[doctor.id];

    _patientDetailService.setDoctorsPatientSelectedDoctor(doctor);

    _navigatorService.navigateToView(TimeAndDateSelectionScreenView(
      doctor: doctor,
      clinicDetails: detailsForTheClinicOfDoctor,
    ));
  }

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
