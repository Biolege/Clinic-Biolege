import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';
import '../../../../services/services/helperData_service.dart';

class ShowCustomerDetailsSummaryScreenModel
    extends FutureViewModel<Map<String, String>> {
  // _________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final PatientDetails _patientDetailsService = locator<PatientDetails>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  // _________________________________________________________________________

  void customerDoctorSelection() {
    _navigatorService.navigateTo(Routes.customerDoctorSelectionScreenView);
  }

  @override
  Future<Map<String, String>> futureToRun() async {
    try {
      Map<String, String> patientDetails = {
        "name": _patientDetailsService.getDoctorsPatientName(),
        "phone": _patientDetailsService.getDoctorsPatientPhoneNumber(),
        "dob": _patientDetailsService.getDoctorsPatientDob().toString(),
        "state": _patientDetailsService.getDoctorsPatientStateName(),
        "pincode": _patientDetailsService.getDoctorsPatientPinCode(),
        "address": _patientDetailsService.getDoctorsPatientHomeAddress(),
        "bg": _patientDetailsService.getDoctorsPatientBloodGroup(),
      };
      print(patientDetails);
      return patientDetails;
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
      throw UnimplementedError();
    }
  }
}
