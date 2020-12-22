import 'auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  ThemeService get themeService;
  AuthenticationService get authenticationService;
  DialogService get dialogService;
  SnackbarService get snackbarService;
}
