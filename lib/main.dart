import 'package:clinicapp/widgets/dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splashScreen/splashScreenView.dart';
import 'theme/theme.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'app/router.gr.dart' as router;
import 'app/locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ThemeManager.initialise();
  setupLocator();
  setupDialogUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String mainLogo = "asset/images/logo.png";
    String subLogo = "asset/images/sublogo.png";
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
