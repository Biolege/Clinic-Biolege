import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../theme/theme.dart';
import '../../../widgets/animations.dart';
import '../../../services/services/dataFromApiService.dart';
import '../../../services/services/helperData_service.dart';
import '../../../app/locator.dart';
import '../../../app/router.router.dart';
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
  // final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  // final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________
  // Variables

  BuildContext viewBuildContext;
  TextEditingController searchedPatient = TextEditingController();
  // Selected list type
  // false : Scheduled , true: Completed
  bool listType = false;
  // Counter Variables
  int totalCustomers = 0, completedCustomers = 0, scheduledCustomers = 0;
  // Doctors Variables
  Doctor selectedDoctor;
  String selectedDocID;
  // Clinic Variables
  Clinic _clinic;
  // Doctors List to Display
  List<Doctor> _doctorsListForClinic = [];
  List<DiagnosticCustomer> customersForSelectedDoctor = [];
  // Scheduled and Completed Customers for the selected doctor
  List<DiagnosticCustomer> customerToDisplay = [];
  List<DiagnosticCustomer> scheduledCustomersForSelectedDoctor = [];
  List<DiagnosticCustomer> completedCustomersForSelectedDoctor = [];
  // Helper variables
  Map<String, AppointmentDate> appointmentCorrespondingToCustomers = {};
  List<DiagnosticCustomer> temporaryList = [];
  List<DiagnosticCustomer> customerForSelectedDateSelectedDoctor = [];

  // __________________________________________________________________________
  // Helper Functions

  void setListType(int v) {
    if (v == 0)
      listType = false;
    else
      listType = true;

    if (listType == false)
      customerToDisplay = scheduledCustomersForSelectedDoctor;
    else
      customerToDisplay = completedCustomersForSelectedDoctor;

    notifyListeners();
  }

  void openPatientDetailsView(DiagnosticCustomer dgtcst) {
    _doctorAppointmentsDetailservice
        .setSelectedDiagnosticCustomerForAppointmentDetails(dgtcst);
    _navigatorService.navigateTo(PatientAppointmentDetailsScreenView.routeName);
  }

  void addPatientView() =>
      _navigatorService.navigateTo(Routes.addCustomerScreenView);

  void refresh() {
    setBusy(true);
    // Resetting all the values
    setListType(!listType ? 0 : 1);
    scheduledCustomers = 0;
    completedCustomers = 0;

    temporaryList.clear();
    customersForSelectedDoctor.clear();
    customerToDisplay.clear();
    appointmentCorrespondingToCustomers.clear();

    DateTime appoinmentScreenDate =
        _doctorAppointmentsDetailservice.getSelectedDateInAppointmentTab;

    selectedDoctor = _doctorAppointmentsDetailservice.getSelectedDoctor;

    Map<String, DiagnosticCustomer> mapped =
        _dataFromApiService.getDiagnosticCustomersMappedList;

    // First store all the patients that have appointments same as
    // tbe appoinmentScreenDate date vairable (displayed on the screen)
    selectedDoctor.customers.forEach((customer) => ((customer.appointmentDate
                .any((dt) =>
                    dt.date.day == appoinmentScreenDate.day &&
                    dt.date.month == appoinmentScreenDate.month)) ==
            true)
        ? temporaryList.add(mapped[customer.id])
        : null);

    // Then filter out the patient of this clinic
    temporaryList.forEach((dgcCustomer) {
      dgcCustomer.doctors
          .forEach((doctorObject) => (doctorObject.clinic.id == _clinic.id)
              ? {
                  customersForSelectedDoctor.add(dgcCustomer),
                  doctorObject.visitingDate
                      .where((appointment) =>
                          appointment.date.day == appoinmentScreenDate.day &&
                          appointment.date.month == appoinmentScreenDate.month)
                      .forEach((appointmentDate) =>
                          appointmentCorrespondingToCustomers[dgcCustomer.id] =
                              appointmentDate)
                }
              : null);
    });

    // Logic to calculate scheduled and completed counter variables
    appointmentCorrespondingToCustomers.forEach((key, value) {
      if (value.isCompleted == 0) {
        print(mapped[key].id);
        scheduledCustomersForSelectedDoctor.add(mapped[key]);
        scheduledCustomers++;
      } else {
        print(mapped[key].id);
        completedCustomersForSelectedDoctor.add(mapped[key]);
        completedCustomers++;
      }
    });

    totalCustomers = scheduledCustomers + completedCustomers;

    // Set the selected diagnostic customer in the appointment tab
    _doctorAppointmentsDetailservice
        .setAppointmentCorrespondingToSelectedCustomers(
            appointmentCorrespondingToCustomers);

    setBusy(false);
    notifyListeners();
  }

  void setDoctorToShowInAppointments(Doctor doc) async {
    selectedDocID = doc.id;
    _doctorAppointmentsDetailservice.setSelectedDoctor(doc);
    Navigator.pop(viewBuildContext);
    notifyListeners();
  }

  Future<void> showDoctorsList(BuildContext ctx) async {
    viewBuildContext = ctx;
    await buildSelectableDoctorsBottomSheet();
    refresh();
    notifyListeners();
  }

  Future buildSelectableDoctorsBottomSheet() {
    return showModalBottomSheet(
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
      context: viewBuildContext,
    );
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
