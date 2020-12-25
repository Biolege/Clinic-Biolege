import 'package:clinicapp/main.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/reusables.dart';
import '../../../app/size_configuration.dart';
import '../../../widgets/animations.dart';
import 'createOrSearchClinicScreenViewModel.dart';

class CreateOrSearchClinicScreenView extends StatelessWidget {
  static const routeName = "/createOrSearchClinicScreen";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateOrSearchClinicViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  height: SizeConfig.screenHeight * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FadeInLTR(
                            0.3,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome to",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Image.asset(
                                  mainLogo,
                                  height: getProportionateScreenHeight(30),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(50),
                      ),
                      FadeInLTR(
                        0.6,
                        Column(
                          children: [
                            model.getRoleType == 0
                                ? buildBasicOutlineButton(
                                    Row(
                                      children: [
                                        Icon(Icons.add),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(30),
                                        ),
                                        Text(
                                          "Create a new clinic",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    model.navigateToAddClinicView)
                                : Container(),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            buildBasicOutlineButton(
                                Row(
                                  children: [
                                    Icon(Icons.search),
                                    SizedBox(
                                      width: getProportionateScreenWidth(30),
                                    ),
                                    Text(
                                      "Search for a Clinic",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                model.navigateToSeachClinicView),
                          ],
                        ),
                      ),
                      Spacer(),
                      // FadeInLTR(0.9, buildOutlineButton("Continue", null)),
                    ],
                  ),
                )),
          )),
        );
      },
      onModelReady: (model) => model.setRoleType(),
      viewModelBuilder: () => CreateOrSearchClinicViewModel(),
    );
  }
}
