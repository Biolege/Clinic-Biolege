import 'package:clinicapp/app/size_configuration.dart';
import 'package:clinicapp/theme/theme.dart';
import 'package:clinicapp/widgets/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';

import 'clinicProfileScreenViewModel.dart';

class ClinicProfileScreenView extends StatefulWidget {
  static const routeName = "/clinicProfileScreenView";
  @override
  _ClinicProfileScreenViewState createState() =>
      _ClinicProfileScreenViewState();
}

class _ClinicProfileScreenViewState extends State<ClinicProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClinicProfileScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                appBar: buildAppBar(context),
                floatingActionButton: FloatingActionButton.extended(
                    backgroundColor: offWhite1,
                    onPressed: model.showMap,
                    label: Row(
                      children: [
                        Icon(Entypo.map),
                        SizedBox(width: 10),
                        Text("Show Directions"),
                      ],
                    )),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              top: getProportionateScreenHeight(60),
                              left: 0,
                              child: Container(
                                decoration: getUpperRoundedBorder(offWhite),
                                width: getProportionateScreenWidth(600),
                                height: getProportionateScreenHeight(120),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  width: 100,
                                  height: 100,
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 100.0,
                                    backgroundImage: NetworkImage(
                                        'https://i.pinimg.com/474x/2e/17/2c/2e172cfc7c4a3c10114726bf1ce2b211.jpg'),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, right: 10),
                                      child: Text(
                                        model.getClinic.name,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Divider(),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          title: Text(
                            "Phone number",
                            style: TextStyle(fontSize: 12, color: offBlack3),
                          ),
                          subtitle: Text(
                            model.getClinic.phoneNumber.toString(),
                            style: TextStyle(fontSize: 18, color: offBlack2),
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          title: Text(
                            "Location",
                            style: TextStyle(fontSize: 12, color: offBlack3),
                          ),
                          subtitle: Text(
                            model.getClinicLocationType,
                            style: TextStyle(fontSize: 18, color: offBlack2),
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          title: Text(
                            "Street address",
                            style: TextStyle(fontSize: 12, color: offBlack3),
                          ),
                          subtitle: Text(
                            model.getClinic.address.clinicAddress,
                            style: TextStyle(fontSize: 18, color: offBlack2),
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          title: Text(
                            "City and state",
                            style: TextStyle(fontSize: 12, color: offBlack3),
                          ),
                          subtitle: Text(
                            model.getClinic.address.city +
                                ", " +
                                model.getClinic.address.state +
                                ", " +
                                model.getClinic.address.pincode.toString(),
                            style: TextStyle(fontSize: 18, color: offBlack2),
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          title: Text(
                            "Services Available",
                            style: TextStyle(fontSize: 12, color: offBlack3),
                          ),
                          subtitle: ListView.builder(
                              primary: false,
                              itemCount: model.getClinic.services.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  Text(model.getClinic.services[index])),
                        ),
                        Divider(),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          title: Text(
                            "Owner Name",
                            style: TextStyle(fontSize: 12, color: offBlack3),
                          ),
                          subtitle: Text(
                            model.getClinic.ownerName,
                            style: TextStyle(fontSize: 18, color: offBlack2),
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          title: Text(
                            "Owner Phone",
                            style: TextStyle(fontSize: 12, color: offBlack3),
                          ),
                          subtitle: Text(
                            model.getClinic.ownerPhoneNumber.toString(),
                            style: TextStyle(fontSize: 18, color: offBlack2),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Scaffold(
                appBar: buildAppBar(context),
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
      viewModelBuilder: () => ClinicProfileScreenViewModel(),
    );
  }
}
