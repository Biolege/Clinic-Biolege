import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/gestures.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../main.dart';
import '../../../../widgets/reusables.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/animations.dart';
import 'enterOwnerDetailsViewModel.dart';

class AddClinicOwnerDetailsScreenView extends StatelessWidget {
  static const routeName = "/addClinicOwnerDetailsScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddClinicOwnerDetailsViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                            Image.asset(
                              mainLogo,
                              height: getProportionateScreenHeight(25),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  FadeInLTR(
                    0.6,
                    Text(
                      "Clinic Owner",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Form(
                      key: model.clinicOwnerDetailsFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInLTR(
                            0.6,
                            Text(
                              "Clinic Owner Name",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          FadeInLTR(
                            0.6,
                            TextFormField(
                              validator: (value) =>
                                  model.validateClinicOwnerName(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 30,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              keyboardType: TextInputType.name,
                              decoration: buildInputDecoration(
                                  "Name",
                                  Icon(
                                    MaterialCommunityIcons.account,
                                    color: primaryColor,
                                  )),
                              controller: model.clinicOwnerName,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          FadeInLTR(
                            0.9,
                            Text(
                              "Clinic Phone Number",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          FadeInLTR(
                            0.9,
                            TextFormField(
                              validator: (value) =>
                                  model.validateClinicOwnerPhoneNumber(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 10,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              keyboardType: TextInputType.phone,
                              decoration: buildInputDecoration(
                                  "Phone Number",
                                  Icon(
                                    MaterialCommunityIcons.account,
                                    color: primaryColor,
                                  )),
                              controller: model.clinicPhoneNumber,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          FadeInLTR(
                            1.2,
                            Text(
                              "Clinic Owner ID proof",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          FadeInLTR(
                            1.2,
                            Center(
                              child: ToggleSwitch(
                                  minWidth: SizeConfig.screenWidth / 3.5,
                                  minHeight: getProportionateScreenHeight(40),
                                  fontSize: 12,
                                  initialLabelIndex: 0,
                                  activeBgColor: offWhite,
                                  activeFgColor: offWhite1,
                                  inactiveBgColor: offWhite1,
                                  inactiveFgColor: offBlack2,
                                  activeBgColors: [
                                    Colors.blueGrey,
                                    Colors.blueGrey,
                                    Colors.blueGrey
                                  ],
                                  labels: [
                                    'PAN Card',
                                    'Aadhar Card',
                                    'Voter Card'
                                  ],
                                  onToggle: (index) => {
                                        index == 0
                                            ? model.setIdProofType(0)
                                            : index == 1
                                                ? model.setIdProofType(1)
                                                : model.setIdProofType(2)
                                      }),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          FadeInLTR(
                            1.2,
                            Row(
                              children: [
                                buildBasicOutlineButton(
                                    Text(
                                      "Upload Photo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    () {}),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          FadeInLTR(
                            1.5,
                            Text(
                              "Clinic on Map",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          FadeInLTR(
                            1.5,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  child: GoogleMap(
                                    cameraTargetBounds:
                                        CameraTargetBounds.unbounded,
                                    minMaxZoomPreference:
                                        MinMaxZoomPreference.unbounded,
                                    zoomGesturesEnabled: true,
                                    myLocationButtonEnabled: true,
                                    myLocationEnabled: true,
                                    liteModeEnabled: false,
                                    mapType: MapType.normal,
                                    gestureRecognizers: Set()
                                      ..add(Factory<PanGestureRecognizer>(
                                          () => PanGestureRecognizer())),
                                    onCameraMove: (v) =>
                                        model.pickedLocationOnMap(v),
                                    initialCameraPosition:
                                        model.initialCoordinates,
                                    onMapCreated:
                                        (GoogleMapController controller) {
                                      // Bind the controllers
                                      model.locationOnMapcontroller
                                          .complete(controller);
                                      model.mapController = controller;
                                    },
                                    markers: model.markers,
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Add a marker and drag it your\nclinic location for accuracy",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 12),
                                    ),
                                    !model.isLocationMarked
                                        ? buildBasicOutlineButton(
                                            Text(
                                              "Set marker",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            () => model
                                                .onAddMarkerButtonPressed())
                                        : buildBasicOutlineButton(
                                            Text(
                                              "Remove marker",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            () => model.removeMarker()),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  FadeInLTR(
                    1.8,
                    buildOutlineButton(
                      "Continue",
                      model.saveClinicOwnerDetails,
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => AddClinicOwnerDetailsViewModel(),
    );
  }
}
