import 'package:clinicapp/widgets/animations.dart';

import '../../../theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'customerDoctorSelectionScreenViewModel.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';

class CustomerDoctorSelectionScreenView extends StatelessWidget {
  static const routeName = "/customerDoctorSelectionScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerDoctorSelectionScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                appBar: buildAppBarWithLogoAndText(context, "", Text("Today")),
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
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Doctors available",
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(AntDesign.calendar)
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        model.data.length != 0
                            ? ListView.builder(
                                primary: false,
                                itemCount: model.data.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return FadeInLTR(
                                    0.2,
                                    Card(
                                      color: offWhite,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: white, width: 0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        onTap: () => {},
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                        leading: CircleAvatar(
                                          radius: 25.0,
                                          // backgroundImage: NetworkImage(
                                          //     'https://via.placeholder.com/150'),
                                          backgroundColor: Colors.black12,
                                        ),
                                        title: Text(
                                          model.data[index].name,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        subtitle: Text(model.data[index]
                                                .specialization[0] ??
                                            ''),
                                        trailing: Text(
                                          "Show info",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : Center(
                                child: Text("No doctors to show"),
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
      viewModelBuilder: () => CustomerDoctorSelectionScreenViewModel(),
    );
  }
}
