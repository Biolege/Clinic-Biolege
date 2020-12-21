import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../app/size_configuration.dart';
import '../../../theme/theme.dart';
import '../../../widgets/reusables.dart';
import 'patientDetailsScreenViewModel.dart';

class PatientDetailsScreenView extends StatelessWidget {
  static const routeName = "/patientDetailsScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PatientDetailsScreenViewNModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            appBar: buildAppBarWithLogo(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              label: Text(
                "Change appointment details",
                style: TextStyle(color: white),
              ),
              onPressed: () => model.changeAppointmentDetails(),
              backgroundColor: primaryColor,
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Patient Details",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
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
                            height: getProportionateScreenHeight(120),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "Agnideep Sengupta",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text("21 years"),
                                ],
                              ),
                            ),
                          ),
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
                    height: getProportionateScreenHeight(100),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Feather.user),
                          title: Text(
                            "Gender",
                            style: TextStyle(fontSize: 12),
                          ),
                          subtitle: Text(
                            "Male",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ListTile(
                          leading: Icon(AntDesign.calendar),
                          title: Text(
                            "DOB",
                            style: TextStyle(fontSize: 12),
                          ),
                          subtitle: Text(
                            "04-09-1998",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ListTile(
                          leading: Icon(FontAwesome.phone),
                          title: Text(
                            "Contact",
                            style: TextStyle(fontSize: 12),
                          ),
                          subtitle: Text(
                            "8876977257",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ListTile(
                          leading: Icon(MaterialCommunityIcons.email),
                          title: Text(
                            "E-mail",
                            style: TextStyle(fontSize: 12),
                          ),
                          subtitle: Text(
                            "agnideepsg02@gmail.com",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Entypo.drop),
                          title: Text(
                            "Blood group",
                            style: TextStyle(fontSize: 12),
                          ),
                          subtitle: Text(
                            "A +",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Appointment",
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              "First Visit",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Divider(),
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: white, width: 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150'),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text("Dr. Himmat Singh Rathore"),
                                subtitle: Text("Chest specialist"),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlatButton.icon(
                                    label: Text(
                                      "Sept 12, 2020",
                                      style: TextStyle(
                                          fontSize: 12, color: offBlack2),
                                    ),
                                    icon: Icon(
                                      AntDesign.calendar,
                                      size: 12,
                                      color: blue,
                                    ),
                                    onPressed: () {},
                                  ),
                                  FlatButton.icon(
                                    label: Text(
                                      "11 AM",
                                      style: TextStyle(
                                          fontSize: 12, color: offBlack2),
                                    ),
                                    icon: Icon(
                                      AntDesign.clockcircle,
                                      size: 12,
                                      color: blue,
                                    ),
                                    onPressed: () {},
                                  ),
                                  FlatButton.icon(
                                    label: Text(
                                      "500",
                                      style: TextStyle(
                                          fontSize: 12, color: offBlack2),
                                    ),
                                    icon: Icon(
                                      FontAwesome.rupee,
                                      size: 12,
                                      color: blue,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
          );
        },
        viewModelBuilder: () => PatientDetailsScreenViewNModel());
  }
}
