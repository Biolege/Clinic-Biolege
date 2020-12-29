import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:clinicapp/model/clinic.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';
import '../../app/locator.dart';
import '../../model/clinicEmployee.dart';
import 'local_storage.dart';
import 'package:http_parser/http_parser.dart';

class APIServices {
  // __________________________________________________________________________
  // Variables for Clinic API
  String url = "https://biolegenew.herokuapp.com/api/";
  String urlClinicEmployee = "clinicemployee";
  String urlClinic = "clinic";
  // ---------------------------------------------------------------------------
  // Create a new Clinic Employee and stores the response in the local storage
  Future<ClinicEmployee> createClinicEmployee() async {
    // _______________________________________________________________________
    // Locating Dependencies
    final StorageService _storageService = locator<StorageService>();
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlClinicEmployee/create');
      // Creating a Multipart request for sending formdata
      var request = new http.MultipartRequest("POST", uri);
      // _______________________________________________________________________
      // Prepare the data to be sent
      request..fields['name'] = _storageService.getName;
      request
        ..fields['phoneNumber'] = _storageService.getPhoneNumber.toString();
      request..fields['gender'] = _storageService.getGender;
      request..fields['dob'] = _storageService.getDateOfBirth;
      request..fields['role'] = _storageService.getRoleType.toString();
      request..fields['address.state'] = _storageService.getState;
      request..fields['address.city'] = _storageService.getCityName;
      request
        ..fields['address.pinCode'] = _storageService.getPinCode.toString();
      request..fields['address.homeAddress'] = _storageService.getAddress;

      // _______________________________________________________________________
      // Sending the post request
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var resonseJson = json.decode(responseString);
      // _______________________________________________________________________
      // Saving id for the created user
      print("Clinic employee created with used id : " + resonseJson["_id"]);
      _storageService.setUID(resonseJson["_id"]);
      // _______________________________________________________________________
      return null;
    } catch (e) {
      print(e);
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  Future<Clinic> createClinic() async {
    // _______________________________________________________________________
    // Locating Dependencies
    final StorageService _storageService = locator<StorageService>();
    final SnackbarService _snackBarService = locator<SnackbarService>();

    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlClinic/create');
      // Creating a Multipart request for sending formdata
      var request = new http.MultipartRequest("POST", uri);
      // _______________________________________________________________________
      // Decoding the files to Uint8
      Uint8List clinicLogo = await _storageService.getClinicLogoFromLocal();
      String clinicLogoB64 = base64Encode(clinicLogo);
      Uint8List clinicOwnerIdProof =
          await _storageService.getClinicOwnerIdProofFromLocal();
      String clinicOwnerIdProofB64 = base64Encode(clinicOwnerIdProof);
      Uint8List clinicAddressProof =
          await _storageService.getClinicAddressProofFromLocal();
      String clinicAddressProofB64 = base64Encode(clinicAddressProof);

      // _______________________________________________________________________
      // Preparing the data to be sent
      request..fields['name'] = _storageService.getClinicName;
      request..fields['pincode'] = _storageService.getClinicPinCode;
      request
        ..fields['phoneNumber'] =
            _storageService.getClinicPhoneNumber.toString();
      request
        ..fields['location.latitude'] =
            _storageService.getClinicLocationLatitude.toString();
      request
        ..fields['location.longitude'] =
            _storageService.getClinicLocationLongitude.toString();
      request..fields['ownerName'] = _storageService.getClinicOwnerName;
      request
        ..fields['ownerIdProofName'] =
            _storageService.getClinicOwnerIdProofType == 0
                ? "PAN Card"
                : _storageService.getClinicOwnerIdProofType == 1
                    ? "Aadhar Card"
                    : "Voter Card";
      request
        ..fields['ownerPhoneNumber'] =
            _storageService.getClinicOwnerPhone.toString();
      request..fields['address.state'] = _storageService.getClinicStateName;
      request..fields['address.city'] = _storageService.getClinicCityName;
      request
        ..fields['address.pinCode'] =
            _storageService.getClinicPinCode.toString();
      request
        ..fields['address.clinicAddress'] = _storageService.getClinicAddress;

      request
        ..fields['services'] = _storageService.getClinicServices.toString();

      //----------------------------------------------------------

      request
        ..files.add(new http.MultipartFile.fromBytes(
            'logo', clinicLogoB64.codeUnits,
            contentType: new MediaType('image', 'jpeg')));

      request
        ..files.add(new http.MultipartFile.fromBytes(
            'ownerIdProof', clinicOwnerIdProofB64.codeUnits,
            contentType: new MediaType('image', 'jpeg')));

      request
        ..files.add(new http.MultipartFile.fromBytes(
            'addressProof', clinicAddressProofB64.codeUnits,
            contentType: new MediaType('image', 'jpeg')));

      // _______________________________________________________________________
      // Sending the post request
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var resonseJson = json.decode(responseString);

      // _______________________________________________________________________
      // Saving id for the created clinic
      print("Clinic created with clinic id : " + resonseJson.toString());
      _storageService.setUID(resonseJson["_id"]);
      // _______________________________________________________________________
      return Clinic.fromJson(resonseJson);
    } catch (e) {
      print(e);
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }
  // ---------------------------------------------------------------------------
}
