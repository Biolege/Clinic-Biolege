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
  DateTime _selectedDate;
  TextEditingController searchedPatient = TextEditingController();
  Doctor selectedDoctor;
  List<DiagnosticCustomer> customersForSelectedDoctor = [];
  List<DiagnosticCustomer> customerForSelectedDateSelectedDoctor = [];
  void search(DateTime dt) {
    customersForSelectedDoctor
        .forEach(((cst) => cst.doctors.forEach((appoinment) {
              if (appoinment.visitingDate.contains(_selectedDate))
                customerForSelectedDateSelectedDoctor.add(cst);
            })));
    notifyListeners();
  }

  // __________________________________________________________________________
  void openPatientDetailsView(DiagnosticCustomer dgtcst) {
    _doctorAppointmentsDetailservice.setSelectedDiagnosticCustomer(dgtcst);
    _navigatorService.navigateTo(PatientAppointmentDetailsScreenView.routeName);
  }

  void addPatientView() {
    _navigatorService.navigateTo(Routes.addCustomerScreenView);
  }

  @override
  Future futureToRun() async {
    try {
      selectedDoctor = _doctorAppointmentsDetailservice.getSelectedDoctor();
      selectedDoctor.customers.forEach((customer) =>
          customersForSelectedDoctor.add(_dataFromApiService
              .getDiagnosticCustomersMappedList[customer.id]));
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
