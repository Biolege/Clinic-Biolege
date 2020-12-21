import '../../../../theme/theme.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import 'addBiolegeScreenViewModel.dart';
import '../../../../widgets/reusables.dart';

class AddBiolegeScreenView extends StatelessWidget {
  static const routeName = "/addBiolegeScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddBiolegeScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBarWithLogoAndText(context, "", Text("Today")),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: SizeConfig.screenHeight * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  Text(
                    "Enter Biolege card number",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Form(
                      key: model.biolegeCardForm,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: buildInputDecoration(
                            "Card Number",
                            Icon(
                              AntDesign.idcard,
                              color: primaryColor,
                            )),
                        controller: model.biolegeCardNumber,
                      )),
                  Spacer(),
                  Center(
                    child:
                        buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  AntDesign.qrcode,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Scan Biolege card",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            null),
                  ),
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
                                  FontAwesome.mobile,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Mobile number",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            null),
                        buildOutlineButton(
                          "Continue",
                          model.addCustomerName,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => AddBiolegeScreenViewModel(),
    );
  }
}
