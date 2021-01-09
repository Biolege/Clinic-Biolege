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
  TextEditingController searchedPatient = TextEditingController();
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DoctorAppointments _doctorAppointmentsDetailservice =
      locator<DoctorAppointments>();

  // __________________________________________________________________________
  // Variables
  Doctor selectedDoctor;
  List<DiagnosticCustomer> customersForSelectedDoctor = [];

  void openPatientDetailsView() {
    _navigatorService.navigateTo(Routes.patientAppointmentDetailsScreenView);
  }

  void addPatientView() {
    _navigatorService.navigateTo(Routes.addCustomerScreenView);
  }

  @override
  Future futureToRun() async {
    try {
      selectedDoctor = _doctorAppointmentsDetailservice.getSelectedDoctor();
      selectedDoctor.customers.forEach((customer) =>
          customersForSelectedDoctor.add(
              _dataFromApiService.getDiagnosticCustomerOfDoctors[customer.id]));
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
