import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/router.gr.dart';
import '../../../../services/services/helperData_service.dart';
import '../../../../model/doctor.dart';
import '../../../../screens/homeScreens/doctorsListTabScreens/doctorsProfileScreen/doctorsProfileScreenView.dart';
import '../../../../app/locator.dart';
import '../../../../services/services/dataFromApi_service.dart';

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
    _navigatorService.navigateToView(DoctorsProfileScreenView(
      doctor: doctor,
      clinicDetails: detailsForTheClinicOfDoctor,
      isFromClinic: true,
    ));
  }

  void setDoctorToShowInAppointments(Doctor x) async {
    selectedDocID = x.id;
    _doctorAppointmentsDetailservice.setSelectedDoctor(x);
    // _doctorAppointmentsDetailservice.getController1().call(1);
    // _doctorAppointmentsDetailservice.getController2().call(1);
    notifyListeners();
  }

  void navigateToAddDoctorToClinicScreen() {
    _navigatorService.navigateTo(Routes.selectDoctorClinicScreen);
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
