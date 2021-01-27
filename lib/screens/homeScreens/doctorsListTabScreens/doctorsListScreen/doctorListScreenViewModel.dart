import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/router.gr.dart';
import '../../../../services/services/helperData_service.dart';
import '../../../../model/doctor.dart';
import '../../../../app/locator.dart';
import '../../../../services/services/dataFromApiService.dart';

class DoctorsListScreenViewModel extends FutureViewModel<List<Doctor>> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DoctorAppointments _doctorAppointmentsDetailservice =
      locator<DoctorAppointments>();

  // __________________________________________________________________________
  // Helper functions
  String selectedDocID;

  void profileDescriptionView(Doctor doctor) async {
    ClinicElement detailsForTheClinicOfDoctor =
        _dataFromApiService.getClinicDetailsOfDoctor[doctor.id];
    _doctorAppointmentsDetailservice.setSelectedDoctorToShow(doctor);
    _doctorAppointmentsDetailservice
        .setClinicDetailsForSelectedDoctorToShow(detailsForTheClinicOfDoctor);
    _doctorAppointmentsDetailservice.setIsFromClinic(true);
    _navigatorService.navigateTo(Routes.doctorsProfileScreenView);
  }

  void navigateToAddDoctorToClinicScreen() {
    _navigatorService.navigateTo(Routes.selectDoctorClinicScreen);
  }

  @override
  Future<List<Doctor>> futureToRun() async {
    try {
      List<Doctor> x = _dataFromApiService.getDoctorsListForClinic;
      selectedDocID = _doctorAppointmentsDetailservice.getSelectedDoctor.id;
      return x;
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
      throw UnimplementedError();
    }
  }
}
