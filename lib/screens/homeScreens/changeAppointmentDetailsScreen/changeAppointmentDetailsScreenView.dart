import 'package:clinicapp/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../../theme/theme.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';

import 'changeAppointmentDetailsScreenViewModel.dart';

class ChangeAppointmentDetailsScreenView extends StatelessWidget {
  static const routeName = "/changeAppointmentDetailsScreenView";
  final Doctor doctor;
  final ClinicElement clinicDetails;
  ChangeAppointmentDetailsScreenView({this.doctor, this.clinicDetails});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangeAppointmentDetailsScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.dataReady
            ? Scaffold(
                appBar: buildAppBarWithLogo(context),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: !model.isBusy
                    ? FloatingActionButton.extended(
                        label: Text(
                          "       Done       ",
                          style: TextStyle(color: white),
                        ),
                        onPressed: () => model.updateAppointment(),
                        backgroundColor: primaryColor,
                      )
                    : FloatingActionButton.extended(
                        label: Container(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              backgroundColor: white,
                            )),
                        onPressed: null,
                        backgroundColor: offBlack3,
                      ),
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                            Card(
                              color: offWhite1,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: white, width: 0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                leading: CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150'),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(
                                  model.myClinic.name,
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle:
                                    Text(model.myClinic.address.clinicAddress),
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
                              color: offWhite1,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: white, width: 0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                leading: CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150'),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(
                                  doctor.name,
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle: doctor.specialization != null &&
                                        doctor.specialization.length != 0
                                    ? Text(doctor.specialization[0])
                                    : Container(),
                              ),
                            ),
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
                                  AntDesign.calendar,
                                  color: blue,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(20),
                                ),
                                Text(
                                  "Select Time Slot",
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
                                      contentPadding: const EdgeInsets.all(10),
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
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(100),
                        ),
                      ],
                    ),
                  ),
                )),
              )
            : Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
                appBar: buildAppBarWithLogo(context),
              );
      },
      viewModelBuilder: () => ChangeAppointmentDetailsScreenViewModel(),
    );
  }
}
