import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/animations.dart';
import 'clinicEmployeeListScreenViewModel.dart';
import 'dart:convert';

// import 'package:clinicapp/widgets/reusables.dart';
// import '../../../../widgets/reusables.dart';
class ClinicEmployeeListScreenView extends StatelessWidget {
  static const routeName = "/clinicEmployeeListScreenView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClinicEmployeeListScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInDTU(
                          0.3,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Employees",
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(5),
                              ),
                              Text(
                                model.data.length.toString() + " employees",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),

                        // FadeInDTU(
                        //   0.6,
                        //   Text(
                        //     model.data.length != 0 ? "Tap to view profile" : "",
                        //     style: TextStyle(fontSize: 12, color: offBlack3),
                        //   ),
                        // ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        model.data != null && model.data.length != 0
                            ? FadeInDTU(
                                0.9,
                                ListView.builder(
                                    primary: false,
                                    itemCount: model.data.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        elevation: 0.3,
                                        color: white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: white, width: 0.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ExpansionTile(
                                          // onTap: () =>
                                          //     model.profileDescriptionView(
                                          //         model.data[index]),
                                          childrenPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                          leading:
                                              model.data[index].employeeImage ==
                                                      null
                                                  ? CircleAvatar(
                                                      radius: 20.0,
                                                      backgroundImage: NetworkImage(
                                                          'https://i.pinimg.com/474x/2e/17/2c/2e172cfc7c4a3c10114726bf1ce2b211.jpg'),
                                                    )
                                                  : CircleAvatar(
                                                      child: ClipOval(
                                                        child: Image.memory(
                                                          base64Decode(model
                                                              .data[index]
                                                              .employeeImage),
                                                          width: 100,
                                                          height: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      radius: 25.0,
                                                      backgroundColor:
                                                          Colors.black12,
                                                    ),
                                          title: Text(
                                            model.data[index].name,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          trailing:
                                              Text(model.data[index].role == 0
                                                  ? "Admin"
                                                  : model.data[index].role == 1
                                                      ? "Staff"
                                                      : "Receptionist"),
                                          subtitle:
                                              Text(model.data[index].gender),
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Divider(),
                                                  Text("Phone Number"),
                                                  Text(model.data[index]
                                                              .phoneNumber !=
                                                          null
                                                      ? model.data[index]
                                                          .phoneNumber
                                                          .toString()
                                                      : ''),
                                                  Divider(),
                                                  Text("DOB"),
                                                  Text(model.data[index].dob !=
                                                          null
                                                      ? model.data[index].dob
                                                          .substring(0, 10)
                                                          .toString()
                                                      : ''),
                                                  Divider(),
                                                  Text("Address"),
                                                  Text(model.data[index].address
                                                          .city +
                                                      ", " +
                                                      model.data[index].address
                                                          .state +
                                                      ", " +
                                                      model.data[index].address
                                                          .homeAddress +
                                                      ", " +
                                                      model.data[index].address
                                                          .pinCode
                                                          .toString())
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            : FadeInDTU(
                                0.9,
                                Center(
                                  child: Text("No employee to show"),
                                ),
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
              );
      },
      disposeViewModel: false,
      // createNewModelOnInsert: true,
      viewModelBuilder: () => ClinicEmployeeListScreenViewModel(),
    );
  }
}
