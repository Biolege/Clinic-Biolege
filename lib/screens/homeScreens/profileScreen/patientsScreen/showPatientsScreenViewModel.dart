import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../model/clinic.dart';
import '../../../../model/diagnosticCustomer.dart';
import '../../../../model/doctor.dart';
import '../../../../services/services/dataFromApiService.dart';
import '../../../../services/services/helperData_service.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/animations.dart';

class ShowPatientsScreenViewModel extends FutureViewModel {
// __________________________________________________________________________
  // Locating the Dependencies
  // final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final PatientDetailsAccountScreen _patientDetailsAccountScreenService =
      locator<PatientDetailsAccountScreen>();
  // final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________
  // Variables

  BuildContext viewBuildContext;
  TextEditingController searchedPatient = TextEditingController();
  // Doctors Variables
  Doctor selectedDoctor;
  String selectedDocID;
  // Clinic Variables
  Clinic _clinic;
  // Doctors List to Display
  List<Doctor> _doctorsListForClinic = [];
  List<DiagnosticCustomer> customersForSelectedDoctor = [];
  // Helper variables
  Map<String, AppointmentDate> appointmentCorrespondingToCustomers = {};
  List<DiagnosticCustomer> temporaryList = [];
  List<DiagnosticCustomer> customerForSelectedDateSelectedDoctor = [];

  // __________________________________________________________________________
  // Helper Functions

  // void openPatientDetailsView(DiagnosticCustomer dgtcst) {
  //   _patientDetailsAccountScreenService
  //       .setSelectedDiagnosticCustomerForAppointmentDetails(dgtcst);
  //   _navigatorService.navigateTo(PatientAppointmentDetailsScreenView.routeName);
  // }

  // void addPatientView() =>
  //     _navigatorService.navigateTo(Routes.addCustomerScreenView);

  void refresh() {
    setBusy(true);

    // Resetting all the values
    temporaryList.clear();
    customersForSelectedDoctor.clear();

    DateTime appoinmentScreenDate =
        _patientDetailsAccountScreenService.getSelectedDateInAppointmentTab;

    selectedDoctor = _patientDetailsAccountScreenService.getSelectedDoctor;

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

    // Set the selected diagnostic customer in the appointment tab
    // _patientDetailsAccountScreenService
    //     .setAppointmentCorrespondingToSelectedCustomers(
    //         appointmentCorrespondingToCustomers);

    setBusy(false);
    notifyListeners();
  }

  void setDoctorToShowInAppointments(Doctor doc) async {
    selectedDocID = doc.id;
    _patientDetailsAccountScreenService.setSelectedDoctor(doc);
    Navigator.pop(viewBuildContext);
    notifyListeners();
  }

  Future<void> showDoctorsList(BuildContext ctx) async {
    viewBuildContext = ctx;
    await buildSelectableDoctorsBottomSheet();
    refresh();
    notifyListeners();
  }
// __________________________________________________________________________
  // Date Selectors

  DateFormat formatter = DateFormat('dd-MM-yyyy');
  DateTime _firstDate = DateTime.now().subtract(Duration(days: 20));
  DateTime _lastDate = DateTime.now().add(Duration(days: 20));
  DateTime _selectedDate = DateTime.now();
  String _readableDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  String get getReadableDate => _readableDate;

  void selectAssignedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: _firstDate,
        lastDate: _lastDate);

    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      _readableDate = formatter.format(_selectedDate);
    }

    _patientDetailsAccountScreenService
        .setSelectedDateInAppointmentTab(_selectedDate);
    _patientDetailsAccountScreenService.getRefreshAppointmentList();

    FocusScope.of(context).requestFocus(new FocusNode());
    notifyListeners();
  }
  //__________________________________________________________________________

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
      _patientDetailsAccountScreenService.setDefaultSelectedDoctor();
      _patientDetailsAccountScreenService
          .setSelectedDateInAppointmentTab(_selectedDate);
      _doctorsListForClinic = _dataFromApiService.getDoctorsListForClinic;
      _clinic = _dataFromApiService.getClinic;
      _patientDetailsAccountScreenService.setRefreshAppointmentList(refresh);
      selectedDocID = _patientDetailsAccountScreenService.getSelectedDoctor.id;
      refresh();
    } catch (e) {
      print(e.toString());
      // _snackBarService.showSnackbar(message: e.toString());
    }
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
