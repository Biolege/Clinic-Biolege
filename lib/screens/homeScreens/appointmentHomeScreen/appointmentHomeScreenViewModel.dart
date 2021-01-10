import '../../../screens/homeScreens/patientAppointmentDetailsScreen/PatientAppointmentDetailsScreenView.dart';

import '../../../services/services/dataFromApi_service.dart';
import '../../../services/services/helperData_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../model/diagnosticCustomer.dart';
import '../../../model/doctor.dart';

class AppointmentHomeScreenViewModel extends FutureViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DoctorAppointments _doctorAppointmentsDetailservice =
      locator<DoctorAppointments>();

  // __________________________________________________________________________
  // Variables

  TextEditingController searchedPatient = TextEditingController();
  Doctor selectedDoctor;
  List<DiagnosticCustomer> customersForSelectedDoctor = [];
  List<DiagnosticCustomer> customerForSelectedDateSelectedDoctor = [];

  // __________________________________________________________________________
  void openPatientDetailsView(DiagnosticCustomer dgtcst) {
    _doctorAppointmentsDetailservice.setSelectedDiagnosticCustomer(dgtcst);
    _navigatorService.navigateTo(PatientAppointmentDetailsScreenView.routeName);
  }

  void addPatientView() {
    _navigatorService.navigateTo(Routes.addCustomerScreenView);
  }

  void refresh() {
    customersForSelectedDoctor.clear();
    DateTime x =
        _doctorAppointmentsDetailservice.getSelectedDateInAppointmentTab;
    selectedDoctor = _doctorAppointmentsDetailservice.getSelectedDoctor();
    selectedDoctor.customers.forEach((customer) {
      if (customer.appointmentDate
          .any((dt) => dt.day == x.day && dt.month == x.month))
        customersForSelectedDoctor.add(
            _dataFromApiService.getDiagnosticCustomersMappedList[customer.id]);
    });

    notifyListeners();
  }

  @override
  Future futureToRun() async {
    try {
      _doctorAppointmentsDetailservice.setRefreshAppointmentList(refresh);
      refresh();
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
