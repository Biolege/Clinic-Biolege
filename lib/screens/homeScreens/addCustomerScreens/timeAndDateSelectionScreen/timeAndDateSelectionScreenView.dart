import 'package:clinicapp/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/reusables.dart';
import 'timeAndDateSelectionScreenViewModel.dart';

class TimeAndDateSelectionScreenView extends StatelessWidget {
  static const routeName = "/timeAndDateSelectionScreenView";

  TimeAndDateSelectionScreenView({this.doctor, this.clinicDetails});
  final Doctor doctor;
  final ClinicElement clinicDetails;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TimeAndDateSelectionScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBarWithLogoAndText(context, "", Text("Today")),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: !model.isBusy
              ? doctor.services != null &&
                      doctor.services.length != 0 &&
                      clinicDetails.days.length != 0 &&
                      clinicDetails.days != null
                  ? FloatingActionButton.extended(
                      label: Text(
                        "    Confirm    ",
                        style: TextStyle(color: white),
                      ),
                      onPressed: () => model.setAppointment(),
                      backgroundColor: primaryColor,
                    )
                  : FloatingActionButton.extended(
                      label: Text(
                        "    Confirm    ",
                        style: TextStyle(color: white),
                      ),
                      onPressed: null,
                      backgroundColor: offBlack3,
                    )
              : FloatingActionButton.extended(
                  label: Container(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        backgroundColor: white,
                      )),
                  onPressed: null,
                  backgroundColor: offBlack,
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
                                    doctor.name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  doctor.specialization != null &&
                                          doctor.specialization.length != 0
                                      ? Text(doctor.specialization[0])
                                      : Container(),
                                  doctor.experience != null &&
                                          doctor.experience.length != 0
                                      ? Text(((doctor.experience[0]
                                                      .experienceEndYear) -
                                                  doctor.experience[0]
                                                      .experienceStartYear)
                                              .toString() +
                                          " years experience")
                                      : Container(),
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
                            backgroundColor: offWhite,
                            backgroundImage: NetworkImage(
                                'https://img.pngio.com/doc-doctor-pediatrician-icon-doctor-icon-png-512_512.png'),
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
                  clinicDetails.days.length != 0
                      ? Column(
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
                                SizedBox(
                                  height: getProportionateScreenHeight(20),
                                ),
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
                                      "Select Day and Time",
                                      style: TextStyle(color: offBlack2),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(20),
                                ),
                                ListView.builder(
                                    itemCount: clinicDetails.days.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder: (context, index) =>
                                        CheckboxListTile(
                                          contentPadding:
                                              const EdgeInsets.all(10),
                                          value: clinicDetails.days
                                                  .elementAt(index)
                                                  .day ==
                                              model.timeSlotDay,
                                          onChanged: (_) => model.setTimeSlot(
                                              clinicDetails.days
                                                  .elementAt(index)
                                                  .startTime
                                                  .toString(),
                                              clinicDetails.days
                                                  .elementAt(index)
                                                  .endTime
                                                  .toString(),
                                              clinicDetails.days
                                                  .elementAt(index)
                                                  .day),
                                          title: Text(clinicDetails.days
                                              .elementAt(index)
                                              .day),
                                          subtitle: Text(
                                            clinicDetails.days
                                                    .elementAt(index)
                                                    .startTime
                                                    .toString() +
                                                " to " +
                                                clinicDetails.days
                                                    .elementAt(index)
                                                    .endTime
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        )),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
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
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) => model.validateDate(),
                              onTap: () => model.selectAssignedDate(context),
                              controller: model.date,
                              readOnly: true,
                              keyboardType: TextInputType.datetime,
                              decoration: buildInputDecoration(
                                  "Select Date",
                                  Icon(
                                    AntDesign.calendar,
                                    color: blue,
                                  )),
                            ),
                          ],
                        )
                      : Container(
                          height: getProportionateScreenHeight(100),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                    "Doctor has not added thier time slot yet"),
                                SizedBox(
                                  height: 10,
                                ),
                                SelectableText(
                                    "Phone Number +91" + doctor.phoneNumber),
                              ],
                            ),
                          ),
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
