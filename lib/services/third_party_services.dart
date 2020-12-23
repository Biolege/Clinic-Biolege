import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'api_service.dart';
import 'auth_service.dart';
import 'local_storage.dart';

abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  ThemeService get themeService;
  AuthenticationService get authenticationService;
  StorageService get localStorageService;
  APIServices get aPIServices;
  DialogService get dialogService;
  SnackbarService get snackbarService;
}
