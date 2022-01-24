import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.router.dart';
import '../../../../services/services/local_storage.dart';
import '../../../../services/services/filePicker_service.dart';

class AddClinicOwnerDetailsViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final FilePickHelperService _filePickHelperService =
      locator<FilePickHelperService>();

  // __________________________________________________________________________
  // Controller and Variables
  int _idProofType = 0;
  int get getOwnerProofType => _idProofType;
  Uint8List _selectedClinicOwnerIdProof;

  Uint8List get getClinicOwnerIdProof => _selectedClinicOwnerIdProof;

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
  void pickClinicOwnerIdProof() async {
    // Starts the picking process
    var image = await _filePickHelperService.pickImage(ImageSource.gallery);

    // Validate the incoming filesize
    if (validateClinicOwnerIdProof(File(image.path)) == null) return;

    _selectedClinicOwnerIdProof = await image.readAsBytes();

    notifyListeners();
  }

  Future getCurrentLocation() async {
    // Check for services and permission
    bool _serviceEnabled;

    PermissionStatus _permissionGranted;
    Location location = new Location();
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) return null;
    }
    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return null;
    }
    notifyListeners();

    // If all services and permission are granted returns current location
    // var data = await location.getLocation();
    // locationData = data;
    // return data;
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
    clinicLatitude = null;
    clinicLongitude = null;
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

  String validateClinicOwnerIdProof(File file) {
    // Checks if the size the more than 3 Mb
    if (file.lengthSync() > 3000000) {
      _snackBarService.showSnackbar(message: "Image must be of less than 3 Mb");
      return null;
    } else
      return "Success";
  }

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

    if (_selectedClinicOwnerIdProof == null) {
      _snackBarService.showSnackbar(message: "Please upload a ID Proof");
      return;
    }

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
        clinicOwnerIdProof: _selectedClinicOwnerIdProof,
        clinicOwnerIdProofType: _idProofType);
    // Next Page
    navigateToClinicServicesScreen();
  }

  // _________________________________________________________________________
  void navigateToClinicServicesScreen() {
    _navigatorService.navigateTo(
      Routes.clinicServiceSelectionView,
    );
  }
}
