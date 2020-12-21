import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/reusables.dart';
import 'addCustomerScreenViewModel.dart';

class AddCustomerScreenView extends StatelessWidget {
  static const routeName = "/addCustomerScreen";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCustomerScreenViewModel>.reactive(
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
                  "Enter customer mobile number",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Form(
                    key: model.addCustomerFormKey,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: buildInputDecoration(
                          "Phone",
                          Icon(
                            AntDesign.mobile1,
                            color: primaryColor,
                          )),
                      controller: model.newCustomerMobileNumber,
                    )),
                Spacer(),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                          Row(
                            children: [
                              Icon(
                                FontAwesome.vcard,
                                size: 18,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Biolege Card",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          model.addBiolegeCard),
                      buildOutlineButton(
                          "Continue", () => model.addCustomerDetails())
                    ],
                  ),
                )
              ],
            ),
          )),
        );
      },
      viewModelBuilder: () => AddCustomerScreenViewModel(),
    );
  }
}
