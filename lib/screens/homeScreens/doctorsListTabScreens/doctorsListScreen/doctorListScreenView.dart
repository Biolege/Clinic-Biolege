import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import 'doctorListScreenViewModel.dart';
import '../../../../widgets/animations.dart';

// import 'package:clinicapp/widgets/reusables.dart';
// import '../../../../widgets/reusables.dart';
class DoctorsListScreenView extends StatelessWidget {
  static const routeName = "/doctorsListScreenView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoctorsListScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () => model.navigateToAddDoctorToClinicScreen(),
                  backgroundColor: white,
                  child: Icon(Icons.add),
                ),
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInDTU(
                          0.3,
                          Text(
                            "Doctors",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        FadeInDTU(
                          0.6,
                          Text(
                            model.data.length != 0 ? "Tap to view profile" : "",
                            style: TextStyle(fontSize: 12, color: offBlack3),
                          ),
                        ),
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
                                        child: ListTile(
                                          onTap: () =>
                                              model.profileDescriptionView(
                                                  model.data[index]),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                          leading: CircleAvatar(
                                            radius: 25.0,
                                            backgroundColor: Colors.black12,
                                          ),
                                          title: Text(
                                            model.data[index].name,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          subtitle: model.data[index]
                                                          .specialization !=
                                                      null &&
                                                  model
                                                          .data[index]
                                                          .specialization
                                                          .length !=
                                                      0
                                              ? Text(model.data[index]
                                                      .specialization[0] ??
                                                  '')
                                              : Container(),
                                        ),
                                      );
                                    }),
                              )
                            : FadeInDTU(
                                0.9,
                                Center(
                                  child: Text("No doctors to show"),
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
      viewModelBuilder: () => DoctorsListScreenViewModel(),
    );
  }
}
