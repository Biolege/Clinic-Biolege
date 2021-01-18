import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => model.validatePhoneNumber(value),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
                      Container(),
                      // buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                      //     Row(
                      //       children: [
                      //         Icon(
                      //           FontAwesome.vcard,
                      //           size: 18,
                      //         ),
                      //         SizedBox(
                      //           width: 15,
                      //         ),
                      //         Text(
                      //           "Biolege Card",
                      //           style: TextStyle(
                      //               fontSize: 16, fontWeight: FontWeight.w300),
                      //         )
                      //       ],
                      //     ),
                      //     model.addBiolegeCard),
                      !model.isBusy
                          ? buildOutlineButton(
                              "Continue", model.addCustomerPhone)
                          : buildOutlineButtonCustomWidget(
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenHeight(20),
                                    vertical: 2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("    "),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        backgroundColor: white,
                                      ),
                                    ),
                                    Text("    "),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),
                                  ],
                                ),
                              ),
                              null),
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
