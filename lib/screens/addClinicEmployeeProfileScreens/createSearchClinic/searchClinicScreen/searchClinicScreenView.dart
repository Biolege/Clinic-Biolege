import 'package:clinicapp/model/clinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../../main.dart';
import '../../../../widgets/reusables.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import 'searchClinicScreenViewModel.dart';

class SearchClinicScreenView extends StatelessWidget {
  static const routeName = "/searchClinicScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchClinicViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                appBar: buildAppBar(context),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  mainLogo,
                                  height: getProportionateScreenHeight(25),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(60),
                        ),
                        Text(
                          "Search for Clinic",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        TextFormField(
                          maxLength: 50,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          keyboardType: TextInputType.text,
                          decoration: buildInputDecoration(
                              "Search Clinic",
                              Icon(
                                AntDesign.search1,
                                color: primaryColor,
                              )),
                          controller: model.search,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        ListView.builder(
                            primary: false,
                            itemCount: model.data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SearchCards(
                                data: model.data[index],
                              );
                            }),
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
      viewModelBuilder: () => SearchClinicViewModel(),
    );
  }
}

class SearchCards extends StatelessWidget {
  final Clinic data;
  SearchCards({this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: white,
        borderOnForeground: false,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("asset/images/2.png")),
              ),
              title: Text(
                data.name,
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                data.address.clinicAddress +
                    ", " +
                    data.address.city +
                    ", " +
                    data.address.state,
                style: TextStyle(fontSize: 12, color: offBlack2),
              ),
            )),
      ),
    );
  }
}
