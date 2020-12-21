import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import '../../../app/router.gr.dart';
import '../../../app/locator.dart';

class PatientDetailsScreenViewNModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  void changeAppointmentDetails() {
    _navigatorService.navigateTo(Routes.changeAppointmentDetailsScreenView);
  }
}
