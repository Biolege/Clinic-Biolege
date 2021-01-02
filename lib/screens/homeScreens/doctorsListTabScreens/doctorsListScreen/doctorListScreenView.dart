import 'package:clinicapp/widgets/animations.dart';
import 'package:clinicapp/widgets/reusables.dart';
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
        return !model.isBusy
            ? Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: buildOutlineButton(
                  "Add Doctor to Clinic",
                  () => model.navigateToAddDoctorToClinicScreen(),
                ),
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
                          model.data.length != 0 ? "Available Today" : "",
                          style: TextStyle(fontSize: 16, color: offBlack3),
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
                                        onTap: () =>
                                            model.profileDescriptionView(
                                                model.data[index]),
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
      viewModelBuilder: () => DoctorsListScreenViewModel(),
    );
  }
}
