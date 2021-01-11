import 'package:clinicapp/model/clinic.dart';

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
  Clinic _clinic;
  List<DiagnosticCustomer> customersForSelectedDoctor = [];
  List<DiagnosticCustomer> temporaryList = [];
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
    setBusy(true);
    temporaryList.clear();
    customersForSelectedDoctor.clear();
    DateTime x =
        _doctorAppointmentsDetailservice.getSelectedDateInAppointmentTab;
    selectedDoctor = _doctorAppointmentsDetailservice.getSelectedDoctor();

    var mapped = _dataFromApiService.getDiagnosticCustomersMappedList;

    selectedDoctor.customers.forEach((customer) {
      if (customer.appointmentDate
          .any((dt) => dt.day == x.day && dt.month == x.month)) {
        temporaryList.add(mapped[customer.id]);
      }
    });

    temporaryList.forEach((dgcCustomer) {
      dgcCustomer.doctors.forEach((x) {
        if (x.clinic.id == _clinic.id)
          customersForSelectedDoctor.add(dgcCustomer);
      });
    });

    setBusy(false);
    notifyListeners();
  }

  @override
  Future futureToRun() async {
    try {
      _clinic = _dataFromApiService.getClinic;
      _doctorAppointmentsDetailservice.setRefreshAppointmentList(refresh);
      refresh();
    } catch (e) {
      print(e.toString());
      // _snackBarService.showSnackbar(message: e.toString());
    }
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
