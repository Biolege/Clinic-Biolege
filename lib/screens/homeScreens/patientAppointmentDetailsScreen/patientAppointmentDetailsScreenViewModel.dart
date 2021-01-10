import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import '../../../services/services/dataFromApi_service.dart';
import '../../../services/services/helperData_service.dart';
import '../../../app/router.gr.dart';
import '../../../app/locator.dart';
import '../../../model/diagnosticCustomer.dart';
import '../../../model/doctor.dart';

class PatientAppointmentDetailsScreenViewModel
    extends FutureViewModel<DiagnosticCustomer> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DoctorAppointments _doctorAppointmentsDetailService =
      locator<DoctorAppointments>();
  // __________________________________________________________________________
  // Variables
  DiagnosticCustomer _selectedDiagnosticCustomer;
  Map<String, Doctor> _doctorsMapped = {};
  Map<String, Doctor> get getDoctorsMapped => _doctorsMapped;
  // __________________________________________________________________________
  // Helper Functions

  int getAppointmentsLength(int index) {
    return _selectedDiagnosticCustomer.doctors[index].visitingDate.length;
  }

  String getDoctorSpecialization(int index) {
    return _doctorsMapped[_selectedDiagnosticCustomer.doctors[index].doctor.id]
        .specialization[0]
        .toString();
  }

  List<DateTime> getAppointmentDates(int index) {
    return _selectedDiagnosticCustomer.doctors[index].visitingDate;
  }

  String getWeekDay(int wd) {
    switch (wd) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
    }
  }

  // __________________________________________________________________________
  void changeAppointmentDetails() {
    _navigatorService.navigateTo(Routes.changeAppointmentDetailsScreenView);
  }

  @override
  Future<DiagnosticCustomer> futureToRun() async {
    try {
      _doctorsMapped = _dataFromApiService.getDoctorsListMapped;
      _selectedDiagnosticCustomer =
          _doctorAppointmentsDetailService.getSelectedDiagnosticCustomer();
      return _selectedDiagnosticCustomer;
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError();
  }
}
