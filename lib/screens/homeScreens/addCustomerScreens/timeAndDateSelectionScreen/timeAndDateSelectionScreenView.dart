import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/reusables.dart';
import 'timeAndDateSelectionScreenViewModel.dart';

class TimeAndDateSelectionScreenView extends StatelessWidget {
  static const routeName = "/timeAndDateSelectionScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TimeAndDateSelectionScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBarWithLogoAndText(context, "", Text("Today")),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            label: Text(
              "      Confirm      ",
              style: TextStyle(color: white),
            ),
            onPressed: () => model.confirm(),
            backgroundColor: primaryColor,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          top: getProportionateScreenHeight(50),
                          child: Container(
                            decoration: getUpperRoundedBorder(offWhite),
                            width: SizeConfig.screenWidth,
                            height: getProportionateScreenHeight(180),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "Dr. Himmat Singh Rathore",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Text("Chest specialist"),
                                  Text("12 years experience")
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.transparent,
                          child: CircleAvatar(
                            radius: 100.0,
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/474x/2e/17/2c/2e172cfc7c4a3c10114726bf1ce2b211.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(150),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        AntDesign.checkcircleo,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Text("Available today"),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Set apointments",
                        style: TextStyle(
                            fontSize: 20,
                            color: blue,
                            fontWeight: FontWeight.w600),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                AntDesign.calendar,
                                color: blue,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Text(
                                "Select Date",
                                style: TextStyle(color: offBlack2),
                              )
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Monday",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          "July 25",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                  ),
                                  () {}),
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Monday",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          "July 25",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                  ),
                                  () {}),
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Monday",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          "July 25",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                  ),
                                  () {}),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                AntDesign.clockcircle,
                                color: blue,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Text(
                                "Select Time",
                                style: TextStyle(color: offBlack2),
                              )
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Text(
                                    "Morning",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  () {}),
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Text(
                                    "Noon",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  () {}),
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Text(
                                    "Evening",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  () {}),
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Text(
                                    "Night",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  () {}),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      "09:30 AM",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  () {}),
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      "10:00 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  () {}),
                              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      "10:30 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  () {}),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => TimeAndDateSelectionScreenViewModel(),
    );
  }
}
