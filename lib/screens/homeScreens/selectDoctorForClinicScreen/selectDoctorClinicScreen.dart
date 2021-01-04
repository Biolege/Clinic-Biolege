import 'package:clinicapp/widgets/animations.dart';
import 'package:clinicapp/widgets/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../app/size_configuration.dart';
import '../../../theme/theme.dart';
// import '../../../../widgets/reusables.dart';
import 'selectDoctorClinicScreenModel.dart';

class SelectDoctorClinicScreen extends StatelessWidget {
  static const routeName = "/selectDoctorClinicScreen";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectDoctorClinicScreenViewModel>.reactive(
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
                        Text(
                          "Search Doctors",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          "Select doctor to add to your clinic",
                          style: TextStyle(fontSize: 16, color: offBlack3),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Form(
                            key: model.searchFormKey,
                            onChanged: () => model.search(),
                            child: TextFormField(
                              onChanged: (value) => model.search(),
                              keyboardType: TextInputType.name,
                              decoration: buildInputDecoration(
                                  "Search",
                                  Icon(
                                    EvilIcons.search,
                                    color: primaryColor,
                                  )),
                              controller: model.searchedText,
                            )),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        model.results.length != 0
                            ? ListView.builder(
                                primary: false,
                                itemCount: model.results.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return FadeInLTR(
                                    0.1,
                                    Card(
                                      // color: offWhite,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: white, width: 0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        enabled: !model.clinicDetailsOfDoctor
                                            .containsKey(
                                                model.results[index].id),
                                        onTap: () =>
                                            model.profileDescriptionView(
                                                model.results[index]),
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
                                          model.results[index].name,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        subtitle: Text(model.results[index]
                                                .specialization[0] ??
                                            ''),
                                        trailing: model.clinicDetailsOfDoctor
                                                .containsKey(
                                                    model.results[index].id)
                                            ? Text("Already added",
                                                style: TextStyle(fontSize: 10))
                                            : Text(
                                                "Show info",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                      ),
                                    ),
                                  );
                                })
                            : Column(
                                children: [
                                  Center(
                                    child: Text("No doctors to show"),
                                  ),
                                ],
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
      onModelReady: (model) => model.getDoctorsList(),
      viewModelBuilder: () => SelectDoctorClinicScreenViewModel(),
    );
  }
}
