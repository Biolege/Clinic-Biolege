import 'package:clinicapp/app/locator.dart';
import 'package:clinicapp/model/clinicEmployee.dart';
import 'package:clinicapp/services/services/dataFromApiService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClinicEmployeeListScreenViewModel
    extends FutureViewModel<List<ClinicEmployee>> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();

  // __________________________________________________________________________
  // Helper functions

  void profileDescriptionView(ClinicEmployee clinicEmp) async {
    // ClinicElement detailsForTheClinicOfDoctor =
    //     _dataFromApiService.getClinicDetailsOfDoctor[doctor.id];
    // _doctorAppointmentsDetailservice.setSelectedDoctorToShow(doctor);
    // _doctorAppointmentsDetailservice
    //     .setClinicDetailsForSelectedDoctorToShow(detailsForTheClinicOfDoctor);
    // _doctorAppointmentsDetailservice.setIsFromClinic(true);
    // _navigatorService.navigateTo(Routes.doctorsProfileScreenView);
  }

  @override
  Future<List<ClinicEmployee>> futureToRun() async {
    try {
      return _dataFromApiService.getClinicEmployeeList;
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
      throw UnimplementedError();
    }
  }
}
