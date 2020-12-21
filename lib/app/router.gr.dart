// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/homeScreens/addCustomerScreens/addBiolegeCardAddNameScreen/addBiolegeCardAddNameScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addBiolegeCardScreen/addBiolegeScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerDetailsScreen/addCustomerDetailsScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerScreen/addCustomerScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/confirmationScreen/confirmScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/timeAndDateSelectionScreen/timeAndDateSelectionScreenView.dart';
import '../screens/homeScreens/appointmentHomeScreen/appointmentHomeScreenView.dart';
import '../screens/homeScreens/changeAppointmentDetailsScreen/changeAppointmentDetailsScreenView.dart';
import '../screens/homeScreens/customerDoctorSelectionScreen/customerDoctorSelectionScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsListScreen/doctorListScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsProfileScreen/doctorsProfileScreenView.dart';
import '../screens/homeScreens/homeScreenView.dart';
import '../screens/homeScreens/patientDetailsScreen/patientDetailsScreenView.dart';
import '../screens/profileScreens/addressScreen/addressScreenView.dart';
import '../screens/profileScreens/createSearchClinic/clinicDescriptionScreen/enterClinicDescriptionScreenView.dart';
import '../screens/profileScreens/createSearchClinic/createClinicScreen/createClinicScreenView.dart';
import '../screens/profileScreens/createSearchClinic/createOrSearchClinicScreenView.dart';
import '../screens/profileScreens/createSearchClinic/searchClinicScreen/searchClinicScreenView.dart';
import '../screens/profileScreens/emailScreen/emailScreenView.dart';
import '../screens/profileScreens/genderScreen/genderScreenView.dart';
import '../screens/profileScreens/nameScreen/nameScreenView.dart';
import '../screens/profileScreens/roleSelectScreen/roleSelectScreenView.dart';
import '../screens/signUpScreens/otpScreen/otpScreenView.dart';
import '../screens/signUpScreens/phoneNumberScreen/phoneScreenView.dart';
import '../screens/welcomeScreen/welcomeScreenView.dart';

class Routes {
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
  static const String createClinicScreenView = '/createClinicScreenView';
  static const String addClinicDescriptionScreenView =
      '/addClinicDescriptionScreenView';
  static const String welcomeScreenView = '/welcomeScreenView';
  static const String homeScreenView = '/homeScreenView';
  static const String appointmentHomeScreenView = '/appointmentHomeScreenView';
  static const String patientDetailsScreenView = '/patientDetailsScreenView';
  static const String changeAppointmentDetailsScreenView =
      '/changeAppointmentDetailsScreenView';
  static const String addCustomerScreenView = '/addCustomerScreen';
  static const String addCustomerDetailsScreenView =
      'addCustomerDetailsScreenView';
  static const String addBiolegeScreenView = '/addBiolegeScreenView';
  static const String addBiolegeCardAddNameScreenView =
      'addBiolegeCardAddNameScreenView';
  static const String customerDoctorSelectionScreenView =
      '/customerDoctorSelectionScreenView';
  static const String timeAndDateSelectionScreenView =
      '/timeAndDateSelectionScreenView';
  static const String confirmScreenView = '/confirmScreenView';
  static const String doctorsListScreenView = '/doctorsListScreenView';
  static const String doctorsProfileScreenView = '/doctorsProfileScreenView';
  static const all = <String>{
    phoneScreenView,
    oTPScreenView,
    nameScreenView,
    genderScreenView,
    emailScreenView,
    addressScreenView,
    roleSelectScreenView,
    createOrSearchClinicScreenView,
    searchClinicScreenView,
    createClinicScreenView,
    addClinicDescriptionScreenView,
    welcomeScreenView,
    homeScreenView,
    appointmentHomeScreenView,
    patientDetailsScreenView,
    changeAppointmentDetailsScreenView,
    addCustomerScreenView,
    addCustomerDetailsScreenView,
    addBiolegeScreenView,
    addBiolegeCardAddNameScreenView,
    customerDoctorSelectionScreenView,
    timeAndDateSelectionScreenView,
    confirmScreenView,
    doctorsListScreenView,
    doctorsProfileScreenView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
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
    RouteDef(Routes.createClinicScreenView, page: CreateClinicScreenView),
    RouteDef(Routes.addClinicDescriptionScreenView,
        page: AddClinicDescriptionScreenView),
    RouteDef(Routes.welcomeScreenView, page: WelcomeScreenView),
    RouteDef(Routes.homeScreenView, page: HomeScreenView),
    RouteDef(Routes.appointmentHomeScreenView, page: AppointmentHomeScreenView),
    RouteDef(Routes.patientDetailsScreenView, page: PatientDetailsScreenView),
    RouteDef(Routes.changeAppointmentDetailsScreenView,
        page: ChangeAppointmentDetailsScreenView),
    RouteDef(Routes.addCustomerScreenView, page: AddCustomerScreenView),
    RouteDef(Routes.addCustomerDetailsScreenView,
        page: AddCustomerDetailsScreenView),
    RouteDef(Routes.addBiolegeScreenView, page: AddBiolegeScreenView),
    RouteDef(Routes.addBiolegeCardAddNameScreenView,
        page: AddBiolegeCardAddNameScreenView),
    RouteDef(Routes.customerDoctorSelectionScreenView,
        page: CustomerDoctorSelectionScreenView),
    RouteDef(Routes.timeAndDateSelectionScreenView,
        page: TimeAndDateSelectionScreenView),
    RouteDef(Routes.confirmScreenView, page: ConfirmScreenView),
    RouteDef(Routes.doctorsListScreenView, page: DoctorsListScreenView),
    RouteDef(Routes.doctorsProfileScreenView, page: DoctorsProfileScreenView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
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
    CreateClinicScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateClinicScreenView(),
        settings: data,
      );
    },
    AddClinicDescriptionScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddClinicDescriptionScreenView(),
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
    PatientDetailsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PatientDetailsScreenView(),
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
    AddCustomerDetailsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCustomerDetailsScreenView(),
        settings: data,
      );
    },
    AddBiolegeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddBiolegeScreenView(),
        settings: data,
      );
    },
    AddBiolegeCardAddNameScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddBiolegeCardAddNameScreenView(),
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => TimeAndDateSelectionScreenView(),
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
  };
}
