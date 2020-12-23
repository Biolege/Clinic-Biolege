import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
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
        return Scaffold(
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
                            model.logo,
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
                  Column(
                    children: [
                      SearchCards(),
                      SearchCards(),
                      SearchCards(),
                      SearchCards(),
                      SearchCards(),
                      SearchCards(),
                      SearchCards()
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => SearchClinicViewModel(),
    );
  }
}

class SearchCards extends StatelessWidget {
  const SearchCards({
    Key key,
  }) : super(key: key);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("asset/images/2.png")),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dona Clinic",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Thakurbari road, Hojai",
                    style: TextStyle(fontSize: 15, color: offBlack2),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
