import 'package:clinicapp/theme/theme.dart';
import 'package:clinicapp/widgets/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'showPatientsScreenViewModel.dart';

class ShowPatientsScreenView extends StatefulWidget {
  static const routeName = "/showPatientsScreenView";
  @override
  ShowPatientsScreenViewState createState() => ShowPatientsScreenViewState();
}

class ShowPatientsScreenViewState extends State<ShowPatientsScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShowPatientsScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                appBar: AppBar(title: Text("Clinic Patients"), actions: [
                  InkWell(
                    onTap: () => model.selectAssignedDate(context),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: Column(
                        children: [
                          Text(
                            "Tap to change date",
                            style: TextStyle(color: offBlack1, fontSize: 8),
                          ),
                          Text(
                            model.getReadableDate,
                            style: TextStyle(color: offBlack1, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
                // floatingActionButton: FloatingActionButton(
                //     backgroundColor: white,
                //     onPressed: () => model.addPatientView(),
                //     child: Icon(Icons.add)),
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
                            // FadeInDTU(
                            //   0.9,
                            //   Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //       vertical: 5,
                            //       horizontal: 30,
                            //     ),
                            //     child: TextField(
                            //       controller: model.searchedPatient,
                            //       decoration: InputDecoration(
                            //           border: UnderlineInputBorder(
                            //               borderRadius: BorderRadius.zero),
                            //           counter: Text(""),
                            //           hintText: "Search",
                            //           suffixIcon: Icon(Icons.search)),
                            //     ),
                            //   ),
                            // ),
                            model.customersForSelectedDoctor != null &&
                                    model.customersForSelectedDoctor.length != 0
                                ? FadeInDTU(
                                    0.1,
                                    ListView.builder(
                                        primary: false,
                                        itemCount: model
                                            .customersForSelectedDoctor.length,
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
                                                // onTap: () => model
                                                //     .openPatientDetailsView(
                                                //         model.customersForSelectedDoctor[
                                                //             index]),
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
                                                    .customersForSelectedDoctor[
                                                        index]
                                                    .name),
                                                subtitle: Text(model
                                                    .customersForSelectedDoctor[
                                                        index]
                                                    .phoneNumber
                                                    .toString()),
                                                trailing: Text(model
                                                        .customersForSelectedDoctor[
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
                                                        .customersForSelectedDoctor[
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
                                    child: Text(
                                      "No Appointments to show",
                                    ),
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
      viewModelBuilder: () => ShowPatientsScreenViewModel(),
    );
  }
}
