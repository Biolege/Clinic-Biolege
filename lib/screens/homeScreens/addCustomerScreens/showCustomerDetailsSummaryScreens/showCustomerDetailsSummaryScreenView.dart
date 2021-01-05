import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import '../../../../widgets/reusables.dart';
import 'showCustomerDetailsSummaryScreenViewModel.dart';

class ShowCustomerDetailsSummaryScreen extends StatelessWidget {
  static const routeName = "showCustomerDetailsSummaryScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShowCustomerDetailsSummaryScreenModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                appBar: buildAppBarWithLogoAndText(context, "", Text("Today")),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text(
                            "Patient details",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Text(
                                "Name",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Text(
                                model.data['name'].toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Text(
                                model.data["phone"].toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Text(
                                "Date of birth",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Text(
                                model.data["dob"].substring(0, 10),
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Text(
                                "Address",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Text(
                                model.data["address"] +
                                    " , " +
                                    model.data["state"] +
                                    " , " +
                                    model.data["pincode"],
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              model.data["bg"] != null
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Blood Group",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(10),
                                        ),
                                        Text(
                                          model.data["bg"],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(20),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: getProportionateScreenHeight(50),
                              ),
                              buildOutlineButton(
                                "Set Appointment",
                                model.customerDoctorSelection,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(
                appBar: buildAppBarWithLogoAndText(
                  context,
                  "",
                  Text(""),
                ),
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
      viewModelBuilder: () => ShowCustomerDetailsSummaryScreenModel(),
    );
  }
}
