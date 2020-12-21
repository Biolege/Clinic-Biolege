import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class DoctorsListScreenViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();
  void profileDescriptionView() {
    _navigatorService.navigateTo(Routes.doctorsProfileScreenView);
  }
}
