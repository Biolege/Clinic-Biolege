import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/reusables.dart';
import 'addBiolegeCardAddNameScreenViewModel.dart';

class AddBiolegeCardAddNameScreenView extends StatelessWidget {
  static const routeName = "addBiolegeCardAddNameScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddBiolegeCardAddNameScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBarWithLogoAndText(context, "", Text("Today")),
          body: SafeArea(
              child: Container(
            padding: const EdgeInsets.all(20.0),
            height: SizeConfig.screenHeight * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                Text(
                  "Enter patient name",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Form(
                    key: model.addCustomerNameFormKey,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: buildInputDecoration(
                          "Name",
                          Icon(
                            Icons.account_circle_rounded,
                            color: primaryColor,
                          )),
                      controller: model.newCustomerName,
                    )),
                Spacer(),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      buildOutlineButton(
                          "Continue", model.customerDoctorSelection)
                    ],
                  ),
                )
              ],
            ),
          )),
        );
      },
      viewModelBuilder: () => AddBiolegeCardAddNameScreenViewModel(),
    );
  }
}
