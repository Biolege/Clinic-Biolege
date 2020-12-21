import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
// import '../../../../widgets/reusables.dart';
import 'doctorListScreenViewModel.dart';

class DoctorsListScreenView extends StatelessWidget {
  static const routeName = "/doctorsListScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoctorsListScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          // floatingActionButton: buildOutlineButton(
          //   "Continue",
          //   () {},
          // ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Doctors",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    "Available Today",
                    style: TextStyle(fontSize: 16, color: offBlack3),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Column(
                    children: [
                      Card(
                        color: offWhite,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: white, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          onTap: () => model.profileDescriptionView(),
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
                      Card(
                        color: offWhite,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: white, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                      Card(
                        color: offWhite,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: white, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                      Card(
                        color: offWhite,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: white, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                  )
                ],
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => DoctorsListScreenViewModel(),
    );
  }
}
