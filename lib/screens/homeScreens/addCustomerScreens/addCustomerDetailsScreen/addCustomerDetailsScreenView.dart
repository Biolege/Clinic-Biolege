import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import '../../../../widgets/reusables.dart';
import 'addCustomerDetailsScreenViewModel.dart';

class AddCustomerDetailsScreenView extends StatelessWidget {
  static const routeName = "addCustomerDetailsScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCustomerDetailsScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBarWithLogoAndText(context, "", Text("Today")),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: buildOutlineButton(
            "Set Appointment",
            model.customerDoctorSelection,
          ),
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
                          "Customer name",
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
                          "0101010101",
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
                          "September 04, 1998",
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
                          "Kedia puram, VIP colony, Hojai,Assam-782435",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Text(
                          "Biolege points",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          "192",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Text(
                          "Biolege Card holder",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          "No",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => AddCustomerDetailsScreenViewModel(),
    );
  }
}
