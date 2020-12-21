import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../../theme/theme.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';

import 'changeAppointmentDetailsScreenViewModel.dart';

class ChangeAppointmentDetailsScreenView extends StatelessWidget {
  static const routeName = "/changeAppointmentDetailsScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangeAppointmentDetailsScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBarWithLogoAndText(
            context,
            "Dona clinic",
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: offBlack3,
                ),
                Text(
                  "Dona clinic",
                  style: TextStyle(color: offBlack2),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            label: Text(
              "       Done       ",
              style: TextStyle(color: white),
            ),
            onPressed: () => {},
            backgroundColor: primaryColor,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Provide next appointment date",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: blue,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          Text(
                            "Address",
                            style: TextStyle(color: offBlack2),
                          )
                        ],
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 40),
                        title: Text("Star city hospital"),
                        subtitle: Text("Thakur bari road, Hojai"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            color: blue,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          Text(
                            "Doctor",
                            style: TextStyle(color: offBlack2),
                          )
                        ],
                      ),
                      Card(
                        color: offWhite,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: white, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          leading: CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/150'),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(
                            "Dr. Himmat Singh Rathore",
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text("Chest specialist"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                              () {}),
                          buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                              Text(
                                "Noon",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                              () {}),
                          buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                              Text(
                                "Evening",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                              () {}),
                          buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                              Text(
                                "Night",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "10:00 AM",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ),
                              () {}),
                          buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "10:30 AM",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ),
                              () {}),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => ChangeAppointmentDetailsScreenViewModel(),
    );
  }
}
