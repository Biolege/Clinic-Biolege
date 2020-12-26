import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';
import '../../../../services/services/local_storage.dart';

class AddClinicOwnerDetailsViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();

  // __________________________________________________________________________
  // Controller and Variables
  int _idProofType = 0;
  final clinicOwnerDetailsFormKey = GlobalKey<FormState>();
  TextEditingController clinicOwnerName = TextEditingController();
  TextEditingController clinicPhoneNumber = TextEditingController();
  // Map related controllers
  bool isLocationMarked = false;
  double clinicLongitude, clinicLatitude;
  Completer<GoogleMapController> locationOnMapcontroller = Completer();
  LocationData locationData;
  GoogleMapController mapController;
  // ________________________________________________________
  final Set<Marker> markers = {};
  var _lastMapPosition = LatLng(28.7041, 77.1025);
  // __________________________________________________________

  CameraPosition initialCoordinates = CameraPosition(
    target: LatLng(28.7041, 77.1025),
    zoom: 2,
  );
  final LatLng center = const LatLng(28.7041, 77.1025);

  // __________________________________________________________________________
  // Helper function
  Future<LocationData> getCurrentLocation() async {
    // Check for services and permission
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    Location location = new Location();
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    // If all services and permission are granted returns current location
    var data = await location.getLocation();
    locationData = data;
    return data;
  }

  // _________________________________________________________________________
  // Saving Clinic Owner Description

  // This function updates the coordinates of last position
  // from the map
  void pickedLocationOnMap(CameraPosition position) {
    _lastMapPosition = position.target;
    print("CamView : " + position.target.toString());
  }

  // This function sets the current location of the user
  // and save it to the variables that will be save in local and
  // show error message if user tries to mark again
  // void setCurrentLocationCoordinates() async {
  //   if (markers.length == 0 && isLocationMarked == false) {
  //     isLocationMarked = true;
  //     var userCurrentLocation = await getCurrentLocation();

  //     saveClinicCoordinates(
  //         LatLng(userCurrentLocation.latitude, userCurrentLocation.longitude));

  //     _lastMapPosition =
  //         LatLng(userCurrentLocation.latitude, userCurrentLocation.longitude);
  //     mapController.animateCamera(CameraUpdate.newLatLng(_lastMapPosition));
  //     onAddMarkerButtonPressed();
  //     notifyListeners();
  //   } else
  //     _snackBarService.showSnackbar(
  //         message: "You have already marked a location");
  // }

  // This function marks the current location of the user and
  // show error message if user tries to mark again
  void onAddMarkerButtonPressed() {
    if (markers.length == 0) {
      saveClinicCoordinates(_lastMapPosition);
      markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        draggable: true,
        onDragEnd: (v) => {_lastMapPosition = v, saveClinicCoordinates(v)},
        icon: BitmapDescriptor.defaultMarker,
      ));
      isLocationMarked = true;
      // Update on map
      notifyListeners();
    } else
      _snackBarService.showSnackbar(
          message: "You have already marked a location");
  }

  void removeMarker() {
    markers.clear();
    isLocationMarked = false;
    notifyListeners();
  }

  void saveClinicCoordinates(LatLng coo) async {
    clinicLatitude = coo.latitude;
    clinicLongitude = coo.longitude;
    print(clinicLatitude);
    notifyListeners();
  }

  // _________________________________________________________________________
  void setIdProofType(int type) {
    _idProofType = type;
    print(_idProofType);
  }

  // _________________________________________________________________________
  // Validators
  String validateClinicOwnerName(String value) {
    return value.isEmpty
        ? "Owner name cannot be empty"
        : value.length > 3
            ? null
            : "Owner name should be atleast 4 characters long";
  }

  String validateClinicOwnerPhoneNumber(String phone) {
    return phone.isEmpty
        ? "Phone number cannot be empty"
        : phone.length == 10
            ? null
            : "Phone number should be 10 digits";
  }

  // _________________________________________________________________________
  // Saving to local storages
  void saveClinicOwnerDetails() async {
    clinicOwnerDetailsFormKey.currentState.save();
    if (!clinicOwnerDetailsFormKey.currentState.validate()) return;
    print(clinicLatitude);
    if (clinicLatitude == null) {
      _snackBarService.showSnackbar(
          message: "Please select the clinic location");
      return;
    }
    // Sets the value in Local Storage
    await _storageService.setClinicOwnerDetails(
        clinicOwnerName: clinicOwnerName.text,
        clinicOwnerPhoneNumber: int.parse(clinicPhoneNumber.text),
        clinicLocationLatitude: clinicLatitude,
        clinicLocationLongitude: clinicLongitude,
        // clinicOwnerIdProof: selectedClinicOwnerIdProof,
        clinicOwnerIdProofType: _idProofType);
    // Next Page
    navigateToClinicOwnerDescriptionScreen();
  }

  // _________________________________________________________________________
  void navigateToClinicOwnerDescriptionScreen() {
    _navigatorService.navigateTo(
      Routes.clinicServiceSelectionView,
    );
  }
}
