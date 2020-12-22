import 'package:auto_route/auto_route_annotations.dart';
import 'package:clinicapp/screens/onBoardingScreen/onBoardingScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsListScreen/doctorListScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsProfileScreen/doctorsProfileScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/confirmationScreen/confirmScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/timeAndDateSelectionScreen/timeAndDateSelectionScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addBiolegeCardAddNameScreen/addBiolegeCardAddNameScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addBiolegeCardScreen/addBiolegeScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerDetailsScreen/addCustomerDetailsScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerScreen/addCustomerScreenView.dart';
import '../screens/homeScreens/customerDoctorSelectionScreen/customerDoctorSelectionScreenView.dart';
import '../screens/homeScreens/changeAppointmentDetailsScreen/changeAppointmentDetailsScreenView.dart';
import '../screens/homeScreens/patientDetailsScreen/patientDetailsScreenView.dart';
import '../screens/homeScreens/appointmentHomeScreen/appointmentHomeScreenView.dart';
import '../screens/homeScreens/homeScreenView.dart';
import '../screens/profileScreens/createSearchClinic/clinicDescriptionScreen/enterClinicDescriptionScreenView.dart';
import '../screens/welcomeScreen/welcomeScreenView.dart';
import '../screens/profileScreens/createSearchClinic/createClinicScreen/createClinicScreenView.dart';
import '../screens/profileScreens/createSearchClinic/searchClinicScreen/searchClinicScreenView.dart';
import '../screens/profileScreens/createSearchClinic/createOrSearchClinicScreenView.dart';
import '../screens/profileScreens/roleSelectScreen/roleSelectScreenView.dart';
import '../screens/profileScreens/addressScreen/addressScreenView.dart';
import '../screens/profileScreens/emailScreen/emailScreenView.dart';
import '../screens/profileScreens/genderScreen/genderScreenView.dart';
import '../screens/profileScreens/nameScreen/nameScreenView.dart';
import '../screens/signUpScreens/otpScreen/otpScreenView.dart';
import '../screens/signUpScreens/phoneNumberScreen/phoneScreenView.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(
    path: OnBoardingScreen.routeName,
    page: OnBoardingScreen,
  ),
  MaterialRoute(
    path: PhoneScreenView.routeName,
    page: PhoneScreenView,
  ),
  MaterialRoute(
    path: OTPScreenView.routeName,
    page: OTPScreenView,
  ),
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
  MaterialRoute(
    path: CreateOrSearchClinicScreenView.routeName,
    page: CreateOrSearchClinicScreenView,
  ),
  MaterialRoute(
    path: SearchClinicScreenView.routeName,
    page: SearchClinicScreenView,
  ),
  MaterialRoute(
    path: CreateClinicScreenView.routeName,
    page: CreateClinicScreenView,
  ),
  MaterialRoute(
    path: AddClinicDescriptionScreenView.routeName,
    page: AddClinicDescriptionScreenView,
  ),
  MaterialRoute(
    path: WelcomeScreenView.routeName,
    page: WelcomeScreenView,
  ),
  MaterialRoute(
    path: HomeScreenView.routeName,
    page: HomeScreenView,
  ),
  MaterialRoute(
    path: AppointmentHomeScreenView.routeName,
    page: AppointmentHomeScreenView,
  ),
  MaterialRoute(
    path: PatientDetailsScreenView.routeName,
    page: PatientDetailsScreenView,
  ),
  MaterialRoute(
    path: ChangeAppointmentDetailsScreenView.routeName,
    page: ChangeAppointmentDetailsScreenView,
  ),
  MaterialRoute(
    path: AddCustomerScreenView.routeName,
    page: AddCustomerScreenView,
  ),
  MaterialRoute(
    path: AddCustomerDetailsScreenView.routeName,
    page: AddCustomerDetailsScreenView,
  ),
  MaterialRoute(
    path: AddBiolegeScreenView.routeName,
    page: AddBiolegeScreenView,
  ),
  MaterialRoute(
    path: AddBiolegeCardAddNameScreenView.routeName,
    page: AddBiolegeCardAddNameScreenView,
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
  MaterialRoute(
    path: DoctorsListScreenView.routeName,
    page: DoctorsListScreenView,
  ),
  MaterialRoute(
    path: DoctorsProfileScreenView.routeName,
    page: DoctorsProfileScreenView,
  ),
])
class $Router {}
