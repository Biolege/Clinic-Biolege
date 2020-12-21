import '../../../../app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'confirmScreenViewModel.dart';
import '../../../../theme/theme.dart';

class ConfirmScreenView extends StatelessWidget {
  static const routeName = "/confirmScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            label: Text(
              "      Done      ",
              style: TextStyle(color: white),
            ),
            onPressed: () => model.confirmedAddition(),
            backgroundColor: primaryColor,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your booking has been \nconfirmed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  AntDesign.checkcircle,
                  size: getProportionateScreenHeight(200),
                  color: primaryColor,
                ),
                Text(
                  "Please arrive 15 min before your \nappointment time",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: blue,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(0),
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ConfirmScreenViewModel(),
    );
  }
}
