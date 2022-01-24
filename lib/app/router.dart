// This files contains all the routes of the app
// Simply add a Material Route Constructor with Classname and Routename
// and run the below command
// flutter pub run build_runner build --delete-conflicting-outputs
// _____________________________________________________________________________
import '../screens/homeScreens/profileScreen/clinicEmployeeScreen/clinicEmployeeListScreenView.dart';
import '../screens/homeScreens/profileScreen/patientsScreen/showPatientsScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/customerDoctorSelectionScreen/customerDoctorSelectionScreenView.dart';
import '../screens/homeScreens/profileScreen/employeeProfileScreen/employeeProfileScreenView.dart';
import '../screens/homeScreens/profileScreen/clinicProfileScreen/clinicProfileScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerAddressScreen/addCustomerAddressScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerDetailsScreen/addCustomerDetailsScreenView.dart';
import '../screens/homeScreens/patientAppointmentDetailsScreen/PatientAppointmentDetailsScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerNameScreen/addPatientNameScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/showCustomerDetailsSummaryScreens/showCustomerDetailsSummaryScreenView.dart';
import '../screens/homeScreens/selectDoctorForClinicScreen/selectDoctorClinicScreen.dart';
import '../screens/rootView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/clinicServiceSelectionScreen/clinicServicesScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/clinicDetailsScreen/createClinicScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/clinicOwnerDetailsScreens/enterOwnerDetailsView.dart';
import '../screens/addClinicEmployeeProfileScreens/addressScreen/addressScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/clinicDescriptionScreen/enterClinicDescriptionScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/createOrSearchClinicScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/createSearchClinic/searchClinicScreen/searchClinicScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/emailScreen/emailScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/genderScreen/genderScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/nameScreen/nameScreenView.dart';
import '../screens/addClinicEmployeeProfileScreens/roleSelectScreen/roleSelectScreenView.dart';
import '../screens/onBoardingScreen/onBoardingScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsListScreen/doctorListScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsProfileScreen/doctorsProfileScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/confirmationScreen/confirmScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/timeAndDateSelectionScreen/timeAndDateSelectionScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addBiolegeCardScreen/addBiolegeScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerScreen/addCustomerScreenView.dart';
import '../screens/homeScreens/changeAppointmentDetailsScreen/changeAppointmentDetailsScreenView.dart';
import '../screens/homeScreens/appointmentHomeScreen/appointmentHomeScreenView.dart';
import '../screens/homeScreens/homeScreenView.dart';
import '../screens/welcomeScreen/welcomeScreenView.dart';
import '../screens/signUpScreens/otpScreen/otpScreenView.dart';
import '../screens/signUpScreens/phoneNumberScreen/phoneScreenView.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  // ___________________________________________________________________________
  StackedRoute(path: Root.routeName, page: Root, initial: true),
  // ___________________________________________________________________________
  StackedRoute(
    path: OnBoardingScreen.routeName,
    page: OnBoardingScreen,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: PhoneScreenView.routeName,
    page: PhoneScreenView,
  ),
  StackedRoute(
    path: OTPScreenView.routeName,
    page: OTPScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: NameScreenView.routeName,
    page: NameScreenView,
  ),
  StackedRoute(
    path: GenderScreenView.routeName,
    page: GenderScreenView,
  ),
  StackedRoute(
    path: EmailScreenView.routeName,
    page: EmailScreenView,
  ),
  StackedRoute(
    path: AddressScreenView.routeName,
    page: AddressScreenView,
  ),
  StackedRoute(
    path: RoleSelectScreenView.routeName,
    page: RoleSelectScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: CreateOrSearchClinicScreenView.routeName,
    page: CreateOrSearchClinicScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: SearchClinicScreenView.routeName,
    page: SearchClinicScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: AddClinicScreenView.routeName,
    page: AddClinicScreenView,
  ),
  StackedRoute(
    path: AddClinicDescriptionScreenView.routeName,
    page: AddClinicDescriptionScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: AddClinicOwnerDetailsScreenView.routeName,
    page: AddClinicOwnerDetailsScreenView,
  ),
  StackedRoute(
    path: ClinicServiceSelectionView.routeName,
    page: ClinicServiceSelectionView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: WelcomeScreenView.routeName,
    page: WelcomeScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: HomeScreenView.routeName,
    page: HomeScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: AppointmentHomeScreenView.routeName,
    page: AppointmentHomeScreenView,
  ),
  // ---------------------------------------------------------------------------
  StackedRoute(
    path: PatientAppointmentDetailsScreenView.routeName,
    page: PatientAppointmentDetailsScreenView,
  ),
  StackedRoute(
    path: AddCustomerAddressScreenView.routeName,
    page: AddCustomerAddressScreenView,
  ),
  StackedRoute(
    path: ChangeAppointmentDetailsScreenView.routeName,
    page: ChangeAppointmentDetailsScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: AddCustomerScreenView.routeName,
    page: AddCustomerScreenView,
  ),
  StackedRoute(
    path: AddPatientNameScreenView.routeName,
    page: AddPatientNameScreenView,
  ),
  StackedRoute(
    path: AddCustomerDetailsScreenView.routeName,
    page: AddCustomerDetailsScreenView,
  ),

  StackedRoute(
    path: ShowCustomerDetailsSummaryScreen.routeName,
    page: ShowCustomerDetailsSummaryScreen,
  ),
  StackedRoute(
    path: AddBiolegeScreenView.routeName,
    page: AddBiolegeScreenView,
  ),

  StackedRoute(
    path: CustomerDoctorSelectionScreenView.routeName,
    page: CustomerDoctorSelectionScreenView,
  ),
  StackedRoute(
    path: TimeAndDateSelectionScreenView.routeName,
    page: TimeAndDateSelectionScreenView,
  ),
  StackedRoute(
    path: ConfirmScreenView.routeName,
    page: ConfirmScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: DoctorsListScreenView.routeName,
    page: DoctorsListScreenView,
  ),
  StackedRoute(
    path: DoctorsProfileScreenView.routeName,
    page: DoctorsProfileScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: SelectDoctorClinicScreen.routeName,
    page: SelectDoctorClinicScreen,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: ClinicProfileScreenView.routeName,
    page: ClinicProfileScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: EmployeeProfileScreenView.routeName,
    page: EmployeeProfileScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: ShowPatientsScreenView.routeName,
    page: ShowPatientsScreenView,
  ),
  // ___________________________________________________________________________
  StackedRoute(
    path: ClinicEmployeeListScreenView.routeName,
    page: ClinicEmployeeListScreenView,
  ),
])
class $Router {}
