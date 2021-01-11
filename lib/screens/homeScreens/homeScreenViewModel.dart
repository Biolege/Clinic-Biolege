import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'doctorsListTabScreens/doctorsListScreen/doctorListScreenView.dart';
import 'appointmentHomeScreen/appointmentHomeScreenView.dart';
import '../../app/locator.dart';
import '../../services/services/local_storage.dart';
import '../../services/services/helperData_service.dart';
import 'profileScreen/profileScreenView.dart';
// import '../../model/clinic.dart';
// import '../../model/clinicEmployee.dart';
// import '../../services/services/auth_service.dart';
// import '../../services/services/dataFromApi_service.dart';

class HomeScreenViewModel extends FutureViewModel<String> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final StorageService _storageService = locator<StorageService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DoctorAppointments _doctorAppointmentsDetailservice =
      locator<DoctorAppointments>();
  // final NavigationService _navigatorService = locator<NavigationService>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // final Clinic _clinicDataService = locator<Clinic>();
  // final ClinicEmployee _clinicEmployeeDataService = locator<ClinicEmployee>();
  // final DataFromApi _dataFromApiService = locator<DataFromApi>();

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

    _doctorAppointmentsDetailservice
        .setSelectedDateInAppointmentTab(_selectedDate);
    _doctorAppointmentsDetailservice.getRefreshAppointmentList();

    FocusScope.of(context).requestFocus(new FocusNode());
    notifyListeners();
  }
  //__________________________________________________________________________

  final widgetOptions = [
    DoctorsListScreenView(),
    AppointmentHomeScreenView(),
    Text('Notification'),
    ProfileScreenView(),
  ];

  int _index = 0;

  int get getIndex => _index;
  final PageController pageController = PageController();
  List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(FontAwesome5.user), label: 'Doctors'),
    BottomNavigationBarItem(
        icon: Icon(MaterialIcons.assignment), label: 'Appointments'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesome.bell), label: 'Notifications'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesome.user_circle), label: 'Profile'),
  ];

  void setCurrentIndexForPageView(int selIndex) {
    _index = selIndex;
    print(_index);
    pageController.animateToPage(selIndex,
        duration: Duration(milliseconds: 300), curve: Curves.elasticInOut);
    notifyListeners();
  }

  void selectCurrentPageForNavBar(int selIndex) {
    _index = selIndex;
    print(_index);
    notifyListeners();
  }

  @override
  Future<String> futureToRun() async {
    try {
      _doctorAppointmentsDetailservice
          .setSelectedDateInAppointmentTab(_selectedDate);
      return _storageService.getClinicName;
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError("Error in homepage");
  }
}
