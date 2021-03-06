// This files contains all the routes of the app
// Simply add a Material Route Constructor with Classname and Routename
// and run the below command
// flutter pub run build_runner build --delete-conflicting-outputs
// _____________________________________________________________________________
import 'package:auto_route/auto_route_annotations.dart';
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

@MaterialAutoRouter(routes: <AutoRoute>[
  // ___________________________________________________________________________
  MaterialRoute(
    path: Root.routeName,
    page: Root,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: OnBoardingScreen.routeName,
    page: OnBoardingScreen,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: PhoneScreenView.routeName,
    page: PhoneScreenView,
  ),
  MaterialRoute(
    path: OTPScreenView.routeName,
    page: OTPScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: NameScreenView.routeName,
    page: NameScreenView,
  ),
  MaterialRoute(
    path: GenderScreenView.routeName,
    page: GenderScreenView,
  ),
  MaterialRoute(
    path: EmailScreenView.routeName,
    page: EmailScreenView,
  ),
  MaterialRoute(
    path: AddressScreenView.routeName,
    page: AddressScreenView,
  ),
  MaterialRoute(
    path: RoleSelectScreenView.routeName,
    page: RoleSelectScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: CreateOrSearchClinicScreenView.routeName,
    page: CreateOrSearchClinicScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: SearchClinicScreenView.routeName,
    page: SearchClinicScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: AddClinicScreenView.routeName,
    page: AddClinicScreenView,
  ),
  MaterialRoute(
    path: AddClinicDescriptionScreenView.routeName,
    page: AddClinicDescriptionScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: AddClinicOwnerDetailsScreenView.routeName,
    page: AddClinicOwnerDetailsScreenView,
  ),
  MaterialRoute(
    path: ClinicServiceSelectionView.routeName,
    page: ClinicServiceSelectionView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: WelcomeScreenView.routeName,
    page: WelcomeScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: HomeScreenView.routeName,
    page: HomeScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: AppointmentHomeScreenView.routeName,
    page: AppointmentHomeScreenView,
  ),
  // ---------------------------------------------------------------------------
  MaterialRoute(
    path: PatientAppointmentDetailsScreenView.routeName,
    page: PatientAppointmentDetailsScreenView,
  ),
  MaterialRoute(
    path: AddCustomerAddressScreenView.routeName,
    page: AddCustomerAddressScreenView,
  ),
  MaterialRoute(
    path: ChangeAppointmentDetailsScreenView.routeName,
    page: ChangeAppointmentDetailsScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: AddCustomerScreenView.routeName,
    page: AddCustomerScreenView,
  ),
  MaterialRoute(
    path: AddPatientNameScreenView.routeName,
    page: AddPatientNameScreenView,
  ),
  MaterialRoute(
    path: AddCustomerDetailsScreenView.routeName,
    page: AddCustomerDetailsScreenView,
  ),

  MaterialRoute(
    path: ShowCustomerDetailsSummaryScreen.routeName,
    page: ShowCustomerDetailsSummaryScreen,
  ),
  MaterialRoute(
    path: AddBiolegeScreenView.routeName,
    page: AddBiolegeScreenView,
  ),

  MaterialRoute(
    path: CustomerDoctorSelectionScreenView.routeName,
    page: CustomerDoctorSelectionScreenView,
  ),
  MaterialRoute(
    path: TimeAndDateSelectionScreenView.routeName,
    page: TimeAndDateSelectionScreenView,
  ),
  MaterialRoute(
    path: ConfirmScreenView.routeName,
    page: ConfirmScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: DoctorsListScreenView.routeName,
    page: DoctorsListScreenView,
  ),
  MaterialRoute(
    path: DoctorsProfileScreenView.routeName,
    page: DoctorsProfileScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: SelectDoctorClinicScreen.routeName,
    page: SelectDoctorClinicScreen,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: ClinicProfileScreenView.routeName,
    page: ClinicProfileScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: EmployeeProfileScreenView.routeName,
    page: EmployeeProfileScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: ShowPatientsScreenView.routeName,
    page: ShowPatientsScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: ClinicEmployeeListScreenView.routeName,
    page: ClinicEmployeeListScreenView,
  ),
])
class $Router {}
