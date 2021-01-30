import 'package:clinicapp/widgets/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/size_configuration.dart';
import '../../../theme/theme.dart';
import 'appointmentHomeScreenViewModel.dart';

class AppointmentHomeScreenView extends StatefulWidget {
  static const routeName = "/appointmentHomeScreenView";
  @override
  AppointmentHomeScreenViewState createState() =>
      AppointmentHomeScreenViewState();
}

class AppointmentHomeScreenViewState extends State<AppointmentHomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentHomeScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                floatingActionButton: FloatingActionButton(
                    backgroundColor: white,
                    onPressed: () => model.addPatientView(),
                    child: Icon(Icons.add)),
                body: SafeArea(
                  child: model.selectedDoctor != null
                      ? ListView(
                          shrinkWrap: true,
                          addAutomaticKeepAlives: true,
                          children: [
                            FadeInDTU(
                              0.3,
                              ListTile(
                                contentPadding: const EdgeInsets.all(20),
                                leading: CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150'),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(
                                  model.selectedDoctor.name,
                                  softWrap: true,
                                  style: TextStyle(fontSize: 20),
                                ),
                                subtitle: model.selectedDoctor.specialization !=
                                            null &&
                                        model.selectedDoctor.specialization
                                                .length !=
                                            0
                                    ? Text(
                                        model.selectedDoctor.specialization[0],
                                        softWrap: true,
                                        style: TextStyle(color: offBlack2),
                                      )
                                    : Container(),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () =>
                                      model.showDoctorsList(context),
                                ),
                              ),
                            ),
                            FadeInDTU(
                              0.6,
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        )),
                                    height: getProportionateScreenHeight(150),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "Appointments",
                                          style: TextStyle(
                                              color: offWhite, fontSize: 20),
                                        ),
                                        SizedBox(
                                            height:
                                                getProportionateScreenHeight(
                                                    10)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: TextStyle(
                                                      color: offWhite,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  model.totalCustomers
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: offWhite,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Completed",
                                                  style: TextStyle(
                                                      color: offWhite,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  model.completedCustomers
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: offWhite,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Left",
                                                  style: TextStyle(
                                                      color: offWhite,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  model.scheduledCustomers
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: offWhite,
                                                      fontSize: 15),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    decoration: BoxDecoration(
                                        color: offWhite,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        )),
                                    height: getProportionateScreenHeight(50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FlatButton(
                                          color: Colors.transparent,
                                          onPressed: () => model.setListType(0),
                                          child: Text(
                                            "Schedule",
                                            style: TextStyle(
                                                color: !model.listType
                                                    ? blue
                                                    : offBlack),
                                          ),
                                        ),
                                        Container(
                                          color: offWhite2,
                                          height: 20,
                                          width: 1,
                                        ),
                                        FlatButton(
                                            onPressed: () =>
                                                model.setListType(1),
                                            child: Text("Completed",
                                                style: TextStyle(
                                                    color: model.listType
                                                        ? blue
                                                        : offBlack))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FadeInDTU(
                              0.9,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 30,
                                ),
                                child: TextField(
                                  controller: model.searchedPatient,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.zero),
                                      counter: Text(""),
                                      hintText: "Search",
                                      suffixIcon: Icon(Icons.search)),
                                ),
                              ),
                            ),
                            model.customerToDisplay != null &&
                                    model.customerToDisplay.length != 0
                                ? FadeInDTU(
                                    0.1,
                                    ListView.builder(
                                        primary: false,
                                        itemCount:
                                            model.customerToDisplay.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return FadeInDTU(
                                            0.1,
                                            Card(
                                              color: offWhite,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: white, width: 0.1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ListTile(
                                                onTap: () => model
                                                    .openPatientDetailsView(
                                                        model.customerToDisplay[
                                                            index]),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                ),
                                                leading: CircleAvatar(
                                                  radius: 18.0,
                                                  backgroundImage: NetworkImage(
                                                      'https://via.placeholder.com/150'),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                                title: Text(model
                                                    .customerToDisplay[index]
                                                    .name),
                                                subtitle: Text(model
                                                    .customerToDisplay[index]
                                                    .phoneNumber
                                                    .toString()),
                                                trailing: Text(model
                                                        .customerToDisplay[
                                                            index]
                                                        .doctors
                                                        .last
                                                        .visitingDate
                                                        .last
                                                        .date
                                                        .hour
                                                        .toString() +
                                                    ":" +
                                                    model
                                                        .customerToDisplay[
                                                            index]
                                                        .doctors
                                                        .last
                                                        .visitingDate
                                                        .last
                                                        .date
                                                        .minute
                                                        .toString()),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : Center(
                                    child: Text("No Appointments to show"),
                                  ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                  "Select a doctor in the doctors tab to show appointments"),
                            )
                          ],
                        ),
                ),
              )
            : Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
      viewModelBuilder: () => AppointmentHomeScreenViewModel(),
    );
  }
}
