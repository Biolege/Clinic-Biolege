import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../app/size_configuration.dart';
import '../../../theme/theme.dart';
import '../../../widgets/reusables.dart';
import 'patientAppointmentDetailsScreenViewModel.dart';

class PatientAppointmentDetailsScreenView extends StatelessWidget {
  static const routeName = "/patientAppointmentDetailsScreenView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PatientAppointmentDetailsScreenViewModel>.reactive(
        builder: (context, model, child) {
          return !model.isBusy
              ? Scaffold(
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
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          model.getSelectedDiagnosticCustomer
                                              .name,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text((DateTimeRange(
                                                            start: model
                                                                .getSelectedDiagnosticCustomer
                                                                .dob,
                                                            end: DateTime.now())
                                                        .duration
                                                        .inDays /
                                                    365)
                                                .floor()
                                                .toString() +
                                            " years old")
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
                                  model.getSelectedDiagnosticCustomer.gender,
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
                                  model.getSelectedDiagnosticCustomer.dob
                                      .toIso8601String()
                                      .substring(0, 10),
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
                                  model
                                      .getSelectedDiagnosticCustomer.phoneNumber
                                      .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              ListTile(
                                leading: Icon(MaterialCommunityIcons.home),
                                title: Text(
                                  "Address",
                                  style: TextStyle(fontSize: 12),
                                ),
                                subtitle: Text(
                                  model.getSelectedDiagnosticCustomer.address
                                          .homeAddress +
                                      ", " +
                                      model.getSelectedDiagnosticCustomer
                                          .address.city +
                                      ", " +
                                      model.getSelectedDiagnosticCustomer
                                          .address.state +
                                      ", " +
                                      model.getSelectedDiagnosticCustomer
                                          .address.pincode
                                          .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              model.getSelectedDiagnosticCustomer.bloodGroup !=
                                      null
                                  ? ListTile(
                                      leading: Icon(Entypo.drop),
                                      title: Text(
                                        "Blood group",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      subtitle: Text(
                                        model.getSelectedDiagnosticCustomer
                                            .bloodGroup,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                  : Container(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Appointments",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  // Text(
                                  //   "First Visit",
                                  //   style: TextStyle(fontSize: 15),
                                  // ),
                                ],
                              ),
                              Divider(),
                              ListView.builder(
                                  primary: false,
                                  itemCount: model.getSelectedDiagnosticCustomer
                                      .doctors.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        side:
                                            BorderSide(color: white, width: 0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              radius: 25.0,
                                              backgroundImage: NetworkImage(
                                                  'https://via.placeholder.com/150'),
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                            title: Text(model
                                                .getDoctorsMapped[model
                                                    .getSelectedDiagnosticCustomer
                                                    .doctors[index]
                                                    .doctor
                                                    .id]
                                                .name),
                                            subtitle: Text(
                                                model.getDoctorSpecialization(
                                                    index)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FlatButton.icon(
                                                label: Text(
                                                  model.getAppoinmentDateTime
                                                          .toIso8601String()
                                                          .substring(0, 10) +
                                                      ", " +
                                                      model.getWeekDay(model
                                                          .getAppoinmentDateTime
                                                          .weekday),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: offBlack2),
                                                ),
                                                icon: Icon(
                                                  AntDesign.calendar,
                                                  size: 12,
                                                  color: blue,
                                                ),
                                                onPressed: null,
                                              ),
                                              FlatButton.icon(
                                                label: Text(
                                                  model.getAppoinmentDateTime
                                                          .hour
                                                          .toString() +
                                                      ":" +
                                                      model
                                                          .getAppoinmentDateTime
                                                          .minute
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: offBlack2),
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
                                                      fontSize: 12,
                                                      color: offBlack2),
                                                ),
                                                icon: Icon(
                                                  FontAwesome.rupee,
                                                  size: 12,
                                                  color: blue,
                                                ),
                                                onPressed: null,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                )
              : Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        },
        viewModelBuilder: () => PatientAppointmentDetailsScreenViewModel());
  }
}
