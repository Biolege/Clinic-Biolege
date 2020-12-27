import 'services/filePicker_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'services/api_service.dart';
import 'services/auth_service.dart';
import 'services/local_storage.dart';

abstract class ThirdPartyServicesModule {
  @lazySingleton
  // Servies for navigation
  NavigationService get navigationService;
  // Servies for navigation
  ThemeService get themeService;
  
  AuthenticationService get authenticationService;
  StorageService get localStorageService;
  APIServices get aPIServices;
  DialogService get dialogService;
  SnackbarService get snackbarService;
  FilePickHelperService get filePickHelperService;
}
