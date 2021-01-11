// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../model/doctor.dart';
import '../screens/addClinicEmployeeProfileScreens/addressScreen/addressScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/clinicDescriptionScreen/enterClinicDescriptionScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/clinicDetailsScreen/createClinicScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/clinicOwnerDetailsScreens/enterOwnerDetailsView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/clinicServiceSelectionScreen/clinicServicesScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/createOrSearchClinicScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/searchClinicScreen/searchClinicScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/emailScreen/emailScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/genderScreen/genderScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/nameScreen/nameScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/roleSelectScreen/roleSelectScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addBiolegeCardScreen/addBiolegeScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerAddressScreen/addCustomerAddressScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerDetailsScreen/addCustomerDetailsScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerNameScreen/addPatientNameScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerScreen/addCustomerScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/confirmationScreen/confirmScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/showCustomerDetailsSummaryScreens/showCustomerDetailsSummaryScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/timeAndDateSelectionScreen/timeAndDateSelectionScreenView.dart';
import '../screens/homeScreens/appointmentHomeScreen/appointmentHomeScreenView.dart';
import '../screens/homeScreens/changeAppointmentDetailsScreen/changeAppointmentDetailsScreenView.dart';
import '../screens/homeScreens/customerDoctorSelectionScreen/customerDoctorSelectionScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsListScreen/doctorListScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsProfileScreen/doctorsProfileScreenView.dart';
import '../screens/homeScreens/homeScreenView.dart';
import '../screens/homeScreens/patientAppointmentDetailsScreen/PatientAppointmentDetailsScreenView.dart';
import '../screens/homeScreens/profileScreen/clinicProfileScreen/clinicProfileScreenView.dart';
import '../screens/homeScreens/selectDoctorForClinicScreen/selectDoctorClinicScreen.dart';
import '../screens/onBoardingScreen/onBoardingScreenView.dart';
import '../screens/rootView.dart';
import '../screens/signUpScreens/otpScreen/otpScreenView.dart';
import '../screens/signUpScreens/phoneNumberScreen/phoneScreenView.dart';
import '../screens/welcomeScreen/welcomeScreenView.dart';

class Routes {
  static const String root = '/root';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String phoneScreenView = '/phoneScreenView';
  static const String oTPScreenView = '/otpScreenView';
  static const String nameScreenView = '/nameScreenView';
  static const String genderScreenView = '/genderScreenView';
  static const String emailScreenView = '/emailScreenView';
  static const String addressScreenView = '/addressScreenView';
  static const String roleSelectScreenView = '/roleSelectScreenView';
  static const String createOrSearchClinicScreenView =
      '/createOrSearchClinicScreen';
  static const String searchClinicScreenView = '/searchClinicScreenView';
  static const String addClinicScreenView = '/createClinicScreenView';
  static const String addClinicDescriptionScreenView =
      '/addClinicDescriptionScreenView';
  static const String addClinicOwnerDetailsScreenView =
      '/addClinicOwnerDetailsScreenView';
  static const String clinicServiceSelectionView =
      '/clinicServiceSelectionView';
  static const String welcomeScreenView = '/welcomeScreenView';
  static const String homeScreenView = '/homeScreenView';
  static const String appointmentHomeScreenView = '/appointmentHomeScreenView';
  static const String patientAppointmentDetailsScreenView =
      '/patientAppointmentDetailsScreenView';
  static const String addCustomerAddressScreenView =
      '/addCustomerAddressScreenView';
  static const String changeAppointmentDetailsScreenView =
      '/changeAppointmentDetailsScreenView';
  static const String addCustomerScreenView = '/addCustomerScreen';
  static const String addPatientNameScreenView =
      'addPatientNameScreenViewModel';
  static const String addCustomerDetailsScreenView =
      '/addCustomerDetailsScreenView';
  static const String showCustomerDetailsSummaryScreen =
      'showCustomerDetailsSummaryScreenView';
  static const String addBiolegeScreenView = '/addBiolegeScreenView';
  static const String customerDoctorSelectionScreenView =
      '/customerDoctorSelectionScreenView';
  static const String timeAndDateSelectionScreenView =
      '/timeAndDateSelectionScreenView';
  static const String confirmScreenView = '/confirmScreenView';
  static const String doctorsListScreenView = '/doctorsListScreenView';
  static const String doctorsProfileScreenView = '/doctorsProfileScreenView';
  static const String selectDoctorClinicScreen = '/selectDoctorClinicScreen';
  static const String clinicProfileScreenView = '/clinicProfileScreenView';
  static const all = <String>{
    root,
    onBoardingScreen,
    phoneScreenView,
    oTPScreenView,
    nameScreenView,
    genderScreenView,
    emailScreenView,
    addressScreenView,
    roleSelectScreenView,
    createOrSearchClinicScreenView,
    searchClinicScreenView,
    addClinicScreenView,
    addClinicDescriptionScreenView,
    addClinicOwnerDetailsScreenView,
    clinicServiceSelectionView,
    welcomeScreenView,
    homeScreenView,
    appointmentHomeScreenView,
    patientAppointmentDetailsScreenView,
    addCustomerAddressScreenView,
    changeAppointmentDetailsScreenView,
    addCustomerScreenView,
    addPatientNameScreenView,
    addCustomerDetailsScreenView,
    showCustomerDetailsSummaryScreen,
    addBiolegeScreenView,
    customerDoctorSelectionScreenView,
    timeAndDateSelectionScreenView,
    confirmScreenView,
    doctorsListScreenView,
    doctorsProfileScreenView,
    selectDoctorClinicScreen,
    clinicProfileScreenView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.root, page: Root),
    RouteDef(Routes.onBoardingScreen, page: OnBoardingScreen),
    RouteDef(Routes.phoneScreenView, page: PhoneScreenView),
    RouteDef(Routes.oTPScreenView, page: OTPScreenView),
    RouteDef(Routes.nameScreenView, page: NameScreenView),
    RouteDef(Routes.genderScreenView, page: GenderScreenView),
    RouteDef(Routes.emailScreenView, page: EmailScreenView),
    RouteDef(Routes.addressScreenView, page: AddressScreenView),
    RouteDef(Routes.roleSelectScreenView, page: RoleSelectScreenView),
    RouteDef(Routes.createOrSearchClinicScreenView,
        page: CreateOrSearchClinicScreenView),
    RouteDef(Routes.searchClinicScreenView, page: SearchClinicScreenView),
    RouteDef(Routes.addClinicScreenView, page: AddClinicScreenView),
    RouteDef(Routes.addClinicDescriptionScreenView,
        page: AddClinicDescriptionScreenView),
    RouteDef(Routes.addClinicOwnerDetailsScreenView,
        page: AddClinicOwnerDetailsScreenView),
    RouteDef(Routes.clinicServiceSelectionView,
        page: ClinicServiceSelectionView),
    RouteDef(Routes.welcomeScreenView, page: WelcomeScreenView),
    RouteDef(Routes.homeScreenView, page: HomeScreenView),
    RouteDef(Routes.appointmentHomeScreenView, page: AppointmentHomeScreenView),
    RouteDef(Routes.patientAppointmentDetailsScreenView,
        page: PatientAppointmentDetailsScreenView),
    RouteDef(Routes.addCustomerAddressScreenView,
        page: AddCustomerAddressScreenView),
    RouteDef(Routes.changeAppointmentDetailsScreenView,
        page: ChangeAppointmentDetailsScreenView),
    RouteDef(Routes.addCustomerScreenView, page: AddCustomerScreenView),
    RouteDef(Routes.addPatientNameScreenView, page: AddPatientNameScreenView),
    RouteDef(Routes.addCustomerDetailsScreenView,
        page: AddCustomerDetailsScreenView),
    RouteDef(Routes.showCustomerDetailsSummaryScreen,
        page: ShowCustomerDetailsSummaryScreen),
    RouteDef(Routes.addBiolegeScreenView, page: AddBiolegeScreenView),
    RouteDef(Routes.customerDoctorSelectionScreenView,
        page: CustomerDoctorSelectionScreenView),
    RouteDef(Routes.timeAndDateSelectionScreenView,
        page: TimeAndDateSelectionScreenView),
    RouteDef(Routes.confirmScreenView, page: ConfirmScreenView),
    RouteDef(Routes.doctorsListScreenView, page: DoctorsListScreenView),
    RouteDef(Routes.doctorsProfileScreenView, page: DoctorsProfileScreenView),
    RouteDef(Routes.selectDoctorClinicScreen, page: SelectDoctorClinicScreen),
    RouteDef(Routes.clinicProfileScreenView, page: ClinicProfileScreenView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Root: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Root(),
        settings: data,
      );
    },
    OnBoardingScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnBoardingScreen(),
        settings: data,
      );
    },
    PhoneScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PhoneScreenView(),
        settings: data,
      );
    },
    OTPScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OTPScreenView(),
        settings: data,
      );
    },
    NameScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NameScreenView(),
        settings: data,
      );
    },
    GenderScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GenderScreenView(),
        settings: data,
      );
    },
    EmailScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EmailScreenView(),
        settings: data,
      );
    },
    AddressScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddressScreenView(),
        settings: data,
      );
    },
    RoleSelectScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RoleSelectScreenView(),
        settings: data,
      );
    },
    CreateOrSearchClinicScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateOrSearchClinicScreenView(),
        settings: data,
      );
    },
    SearchClinicScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchClinicScreenView(),
        settings: data,
      );
    },
    AddClinicScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddClinicScreenView(),
        settings: data,
      );
    },
    AddClinicDescriptionScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddClinicDescriptionScreenView(),
        settings: data,
      );
    },
    AddClinicOwnerDetailsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddClinicOwnerDetailsScreenView(),
        settings: data,
      );
    },
    ClinicServiceSelectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ClinicServiceSelectionView(),
        settings: data,
      );
    },
    WelcomeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeScreenView(),
        settings: data,
      );
    },
    HomeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreenView(),
        settings: data,
      );
    },
    AppointmentHomeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppointmentHomeScreenView(),
        settings: data,
      );
    },
    PatientAppointmentDetailsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PatientAppointmentDetailsScreenView(),
        settings: data,
      );
    },
    AddCustomerAddressScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCustomerAddressScreenView(),
        settings: data,
      );
    },
    ChangeAppointmentDetailsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChangeAppointmentDetailsScreenView(),
        settings: data,
      );
    },
    AddCustomerScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCustomerScreenView(),
        settings: data,
      );
    },
    AddPatientNameScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddPatientNameScreenView(),
        settings: data,
      );
    },
    AddCustomerDetailsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCustomerDetailsScreenView(),
        settings: data,
      );
    },
    ShowCustomerDetailsSummaryScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShowCustomerDetailsSummaryScreen(),
        settings: data,
      );
    },
    AddBiolegeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddBiolegeScreenView(),
        settings: data,
      );
    },
    CustomerDoctorSelectionScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomerDoctorSelectionScreenView(),
        settings: data,
      );
    },
    TimeAndDateSelectionScreenView: (data) {
      final args = data.getArgs<TimeAndDateSelectionScreenViewArguments>(
        orElse: () => TimeAndDateSelectionScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TimeAndDateSelectionScreenView(
          doctor: args.doctor,
          clinicDetails: args.clinicDetails,
        ),
        settings: data,
      );
    },
    ConfirmScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ConfirmScreenView(),
        settings: data,
      );
    },
    DoctorsListScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DoctorsListScreenView(),
        settings: data,
      );
    },
    DoctorsProfileScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DoctorsProfileScreenView(),
        settings: data,
      );
    },
    SelectDoctorClinicScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SelectDoctorClinicScreen(),
        settings: data,
      );
    },
    ClinicProfileScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ClinicProfileScreenView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// TimeAndDateSelectionScreenView arguments holder class
class TimeAndDateSelectionScreenViewArguments {
  final Doctor doctor;
  final ClinicElement clinicDetails;
  TimeAndDateSelectionScreenViewArguments({this.doctor, this.clinicDetails});
}
