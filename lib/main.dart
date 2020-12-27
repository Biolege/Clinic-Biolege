import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'services/services/local_storage.dart';
import 'widgets/dialog.dart';
import 'screens/splashScreen/splashScreenView.dart';
import 'theme/theme.dart';
import 'app/router.gr.dart' as router;
import 'app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await ThemeManager.initialise();
  await StorageService().initLocalStorages();

  setupLocator();
  setupDialogUi();
  runApp(MyApp());
}

String mainLogo = "asset/images/logo.png";
String subLogo = "asset/images/sublogo.png";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: getThemeData(),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
          themeMode: themeMode,
          darkTheme: darkTheme,
          theme: regularTheme,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(mainLogo: mainLogo, subLogo: subLogo),
          // initialRoute: Routes.signPageView,
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.Router().onGenerateRoute),
    );
  }
}
