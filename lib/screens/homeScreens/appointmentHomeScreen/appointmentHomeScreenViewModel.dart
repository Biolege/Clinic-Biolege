import 'package:clinicapp/screens/homeScreens/doctorsListTabScreens/doctorsListScreen/doctorListScreenViewModel.dart';
import 'package:clinicapp/theme/theme.dart';
import 'package:clinicapp/widgets/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/services/dataFromApiService.dart';
import '../../../services/services/helperData_service.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../model/diagnosticCustomer.dart';
import '../../../model/doctor.dart';
import '../../../model/clinic.dart';
import '../../../screens/homeScreens/patientAppointmentDetailsScreen/PatientAppointmentDetailsScreenView.dart';

class AppointmentHomeScreenViewModel extends FutureViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final DoctorAppointments _doctorAppointmentsDetailservice =
      locator<DoctorAppointments>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  // final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________
  // Variables
  BuildContext context;

  TextEditingController searchedPatient = TextEditingController();
  Doctor selectedDoctor;
  Clinic _clinic;
  List<Doctor> _doctorsListForClinic = [];
  List<DiagnosticCustomer> customersForSelectedDoctor = [];
  Map<String, AppointmentDate> appointmentCorrespondingToCustomers = {};
  List<DiagnosticCustomer> temporaryList = [];
  List<DiagnosticCustomer> customerForSelectedDateSelectedDoctor = [];
  String selectedDocID;
  // __________________________________________________________________________
  void openPatientDetailsView(DiagnosticCustomer dgtcst) {
    _doctorAppointmentsDetailservice
        .setSelectedDiagnosticCustomerForAppointmentDetails(dgtcst);
    _navigatorService.navigateTo(PatientAppointmentDetailsScreenView.routeName);
  }

  void addPatientView() {
    _navigatorService.navigateTo(Routes.addCustomerScreenView);
  }

  void refresh() {
    setBusy(true);
    temporaryList.clear();
    customersForSelectedDoctor.clear();
    DateTime appoinmentScreenDate =
        _doctorAppointmentsDetailservice.getSelectedDateInAppointmentTab;

    selectedDoctor = _doctorAppointmentsDetailservice.getSelectedDoctor;

    Map<String, DiagnosticCustomer> mapped =
        _dataFromApiService.getDiagnosticCustomersMappedList;

    selectedDoctor.customers.forEach((customer) => ((customer.appointmentDate
                .any((dt) =>
                    dt.date.day == appoinmentScreenDate.day &&
                    dt.date.month == appoinmentScreenDate.month)) ==
            true)
        ? temporaryList.add(mapped[customer.id])
        : null);

    temporaryList.forEach((dgcCustomer) {
      dgcCustomer.doctors
          .forEach((doctorObject) => (doctorObject.clinic.id == _clinic.id)
              ? {
                  customersForSelectedDoctor.add(dgcCustomer),
                  doctorObject.visitingDate
                      .where((appointment) =>
                          appointment.date.day == appoinmentScreenDate.day &&
                          appointment.date.month == appoinmentScreenDate.month)
                      .forEach((element) {
                    appointmentCorrespondingToCustomers[dgcCustomer.id] =
                        element;
                  })
                }
              : null);
    });

    _doctorAppointmentsDetailservice
        .setAppointmentCorrespondingToSelectedCustomers(
            appointmentCorrespondingToCustomers);

    setBusy(false);
    notifyListeners();
  }

  void setDoctorToShowInAppointments(Doctor x) async {
    selectedDocID = x.id;
    _doctorAppointmentsDetailservice.setSelectedDoctor(x);
    Navigator.pop(context);
    notifyListeners();
  }

  Future<void> showDoctorsList(BuildContext ctx) async {
    context = ctx;
    await showModalBottomSheet(
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(
            children: [
              Text(
                "Select Doctors",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  primary: false,
                  itemCount: _doctorsListForClinic.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return FadeInLTR(
                      0.2,
                      Card(
                        elevation: 0.3,
                        color: selectedDocID == _doctorsListForClinic[index].id
                            ? offWhite1
                            : white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: white, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          enabled: true,
                          onTap: () => setDoctorToShowInAppointments(
                              _doctorsListForClinic[index]),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          leading: CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.black12,
                          ),
                          title: Text(
                            _doctorsListForClinic[index].name,
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle:
                              _doctorsListForClinic[index].specialization !=
                                          null &&
                                      _doctorsListForClinic[index]
                                              .specialization
                                              .length !=
                                          0
                                  ? Text(_doctorsListForClinic[index]
                                          .specialization[0] ??
                                      '')
                                  : Container(),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        );
      },
      context: context,
    );

    refresh();
  }

  @override
  Future futureToRun() async {
    try {
      _doctorsListForClinic = _dataFromApiService.getDoctorsListForClinic;
      _clinic = _dataFromApiService.getClinic;
      _doctorAppointmentsDetailservice.setRefreshAppointmentList(refresh);
      selectedDocID = _doctorAppointmentsDetailservice.getSelectedDoctor.id;
      refresh();
    } catch (e) {
      print(e.toString());
      // _snackBarService.showSnackbar(message: e.toString());
    }
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
