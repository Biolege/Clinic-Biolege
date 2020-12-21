import '../services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

final locator = GetIt.instance;

@injectable
void setupLocator() {
  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());
}
