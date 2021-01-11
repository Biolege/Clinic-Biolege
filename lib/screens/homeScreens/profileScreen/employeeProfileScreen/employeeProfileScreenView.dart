import 'package:clinicapp/widgets/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'employeeProfileScreenViewModel.dart';
import '../../../../widgets/reusables.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';

class EmployeeProfileScreenView extends StatefulWidget {
  static const routeName = "/employeeProfileScreenView";
  @override
  _EmployeeProfileScreenViewState createState() =>
      _EmployeeProfileScreenViewState();
}

class _EmployeeProfileScreenViewState extends State<EmployeeProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeeProfileScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                appBar: buildAppBarWithLogo(context),
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
                                        model.getEmployee.name,
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
                        FadeInLTR(
                          0.3,
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            title: Text(
                              "Role",
                              style: TextStyle(fontSize: 12, color: offBlack3),
                            ),
                            subtitle: Text(
                              model.getRoleType,
                              style: TextStyle(fontSize: 18, color: offBlack2),
                            ),
                          ),
                        ),
                        Divider(),
                        FadeInLTR(
                          0.6,
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            title: Text(
                              "Email",
                              style: TextStyle(fontSize: 12, color: offBlack3),
                            ),
                            subtitle: Text(
                              model.getEmployeeEmail,
                              style: TextStyle(fontSize: 18, color: offBlack2),
                            ),
                          ),
                        ),
                        FadeInLTR(
                          0.9,
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            title: Text(
                              "Phone number",
                              style: TextStyle(fontSize: 12, color: offBlack3),
                            ),
                            subtitle: Text(
                              model.getEmployee.phoneNumber.toString(),
                              style: TextStyle(fontSize: 18, color: offBlack2),
                            ),
                          ),
                        ),
                        FadeInLTR(
                          1.2,
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            title: Text(
                              "Gender",
                              style: TextStyle(fontSize: 12, color: offBlack3),
                            ),
                            subtitle: Text(
                              model.getEmployee.gender,
                              style: TextStyle(fontSize: 18, color: offBlack2),
                            ),
                          ),
                        ),
                        FadeInLTR(
                          1.5,
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            title: Text(
                              "Date of birth",
                              style: TextStyle(fontSize: 12, color: offBlack3),
                            ),
                            subtitle: Text(
                              model.getEmployee.dob.substring(0, 10),
                              style: TextStyle(fontSize: 18, color: offBlack2),
                            ),
                          ),
                        ),
                        FadeInLTR(
                          1.5,
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            title: Text(
                              "Street address",
                              style: TextStyle(fontSize: 12, color: offBlack3),
                            ),
                            subtitle: Text(
                              model.getEmployee.address.homeAddress,
                              style: TextStyle(fontSize: 18, color: offBlack2),
                            ),
                          ),
                        ),
                        FadeInLTR(
                          1.8,
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            title: Text(
                              "City and state",
                              style: TextStyle(fontSize: 12, color: offBlack3),
                            ),
                            subtitle: Text(
                              model.getEmployee.address.city +
                                  ", " +
                                  model.getEmployee.address.state +
                                  ", " +
                                  model.getEmployee.address.pinCode.toString(),
                              style: TextStyle(fontSize: 18, color: offBlack2),
                            ),
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
                appBar: buildAppBarWithLogo(context),
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
      viewModelBuilder: () => EmployeeProfileScreenViewModel(),
    );
  }
}
