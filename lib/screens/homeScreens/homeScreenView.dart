import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../app/size_configuration.dart';
import '../../theme/theme.dart';
import '../../widgets/reusables.dart';
import 'homeScreenViewModel.dart';

class HomeScreenView extends StatefulWidget {
  static const routeName = "/homeScreenView";
  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              leadingWidth: SizeConfig.screenWidth / 3,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(Icons.location_pin),
                    Text(
                      "Dona clinic",
                      style: TextStyle(color: offBlack2),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              title: Text(
                "Today",
                style: TextStyle(color: offBlack1, fontSize: 18),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    logoPath,
                    width: SizeConfig.screenWidth / 4.5,
                  ),
                )
              ]),
          body: model.widgetOptions.elementAt(model.getIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.getIndex,
            onTap: (selIndex) => model.setCurrentIndex(selIndex),
            iconSize: 18,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            selectedItemColor: primaryColor,
            unselectedItemColor: offBlack2,
            unselectedLabelStyle: TextStyle(color: offBlack2),
            items: model.items,
          ),
        );
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}
