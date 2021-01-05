import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:clinicapp/model/clinic.dart';
import 'package:clinicapp/model/doctor.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';
import '../../app/locator.dart';
import '../../model/clinicEmployee.dart';
import 'dataFromApi_service.dart';
import 'local_storage.dart';
import 'package:http_parser/http_parser.dart';

class APIServices {
  // __________________________________________________________________________
  // Variables for Clinic API
  String url = "https://biolegenew.herokuapp.com/api/";
  // -------------------------------------------------------------
  // Clinic
  String urlClinicEmployeeCreate = "clinicemployee/create";
  String urlClinicCreate = "clinic/create";
  String updateClinicImages = "clinic/image/";
  // -------------------------------------------------------------
  // Doctors
  String urlGetDoctors = "doctors";
  String urlGetDoctorByID = "doctor";
  String updateDoctor = "doctor";
  String urlGetAllDoctorCustomers = "doctorcustomer/customers";
  // ------------------------------------------------------------
  // Diagnostic Customers
  String urlDiagnosticCustomerCreate = "diagnostic/customer/create";
  // -------------------------------------------------------------------------
  // Create a new Clinic Employee and stores the response in the local storage
  Future<ClinicEmployee> createClinicEmployee() async {
    // _______________________________________________________________________
    // Locating Dependencies
    final StorageService _storageService = locator<StorageService>();
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlClinicEmployeeCreate');
      // Creating a Multipart request for sending formdata
      var request = new http.Request("POST", uri);
      // _______________________________________________________________________
      // Prepare the data to be sent
      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      });

      request.body = jsonEncode({
        'name': _storageService.getName,
        'phoneNumber': _storageService.getPhoneNumber.toString(),
        'gender': _storageService.getGender,
        'dob': _storageService.getDateOfBirth,
        'role': _storageService.getRoleType.toString(),
        'address.state': _storageService.getState,
        'address.pincode': _storageService.getPinCode.toString(),
        'address.homeAddress': _storageService.getAddress,
        'address.city': _storageService.getCityName
      });
      // request..fields['name'] = _storageService.getName;
      // request
      //   ..fields['phoneNumber'] = _storageService.getPhoneNumber.toString();
      // request..fields['gender'] = _storageService.getGender;
      // request..fields['dob'] = _storageService.getDateOfBirth;
      // request..fields['role'] = _storageService.getRoleType.toString();
      // request..fields['address.state'] = _storageService.getState;
      // request..fields['address.city'] = _storageService.getCityName;
      // request
      //   ..fields['address.pincode'] = _storageService.getPinCode.toString();
      // request..fields['address.homeAddress'] = _storageService.getAddress;

      // _______________________________________________________________________
      // Sending the post request
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var resonseJson = json.decode(responseString);
      print(json.encode(resonseJson));
      // _______________________________________________________________________
      // Saving id for the created user
      print("Clinic employee created with used id : " +
          resonseJson["clinicEmployee"]["_id"]);
      _storageService.setUID(resonseJson["clinicEmployee"]["_id"]);
      // _______________________________________________________________________
      return ClinicEmployee.fromJson(resonseJson["clinicEmployee"]);
    } catch (e) {
      print("At create clinic employee :" + e.toString());
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
      var uri = Uri.parse('$url$urlClinicCreate');
      // Creating a Multipart request for sending formdata
      var request = new http.Request("POST", uri);
      // Preparing the data to be sent
      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      });

      request.body = jsonEncode({
        'name': _storageService.getClinicName,
        'pincode': _storageService.getClinicPinCode,
        'phoneNumber': _storageService.getClinicPhoneNumber.toString(),
        'location.latitude':
            _storageService.getClinicLocationLatitude.toString(),
        'location.longitude':
            _storageService.getClinicLocationLongitude.toString(),
        'ownerName': _storageService.getClinicOwnerName,
        'ownerIdProofName': _storageService.getClinicOwnerIdProofType == 0
            ? "PAN Card"
            : _storageService.getClinicOwnerIdProofType == 1
                ? "Aadhar Card"
                : "Voter Card",
        'ownerPhoneNumber': _storageService.getClinicOwnerPhone.toString(),
        'address.state': _storageService.getClinicStateName,
        'address.city': _storageService.getClinicCityName,
        'address.pincode': _storageService.getClinicPinCode.toString(),
        'address.clinicAddress': _storageService.getClinicAddress,
        'services': _storageService.getClinicServices.toString()
      });

      // request..fields['name'] = _storageService.getClinicName;
      // request..fields['pincode'] = _storageService.getClinicPinCode;
      // request
      //   ..fields['phoneNumber'] =
      //       _storageService.getClinicPhoneNumber.toString();
      // request
      //   ..fields['location.latitude'] =
      //       _storageService.getClinicLocationLatitude.toString();
      // request
      //   ..fields['location.longitude'] =
      //       _storageService.getClinicLocationLongitude.toString();
      // request..fields['ownerName'] = _storageService.getClinicOwnerName;
      // request
      //   ..fields['ownerIdProofName'] =
      //       _storageService.getClinicOwnerIdProofType == 0
      //           ? "PAN Card"
      //           : _storageService.getClinicOwnerIdProofType == 1
      //               ? "Aadhar Card"
      //               : "Voter Card";
      // request
      //   ..fields['ownerPhoneNumber'] =
      //       _storageService.getClinicOwnerPhone.toString();
      // request..fields['address.state'] = _storageService.getClinicStateName;
      // request..fields['address.city'] = _storageService.getClinicCityName;
      // request
      //   ..fields['address.pinCode'] =
      //       _storageService.getClinicPinCode.toString();
      // request
      //   ..fields['address.clinicAddress'] = _storageService.getClinicAddress;

      // request
      //   ..fields['services'] = _storageService.getClinicServices.toString();
      // _______________________________________________________________________
      // Sending the post request
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      // _______________________________________________________________________
      // Updating the images related to clinic
      print("Clinic created with clinic id : " + responseJson.toString());

      var finalClinicWithImages =
          await updateClinicImage(responseJson["clinic"]["_id"]);
      // _______________________________________________________________________
      // Saving id for the created clinic
      _storageService.setClinicId(finalClinicWithImages.id);
      // _______________________________________________________________________
      return finalClinicWithImages;
    } catch (e) {
      print("At create clinic : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  Future<Clinic> updateClinicImage(String clinicId) async {
    // _________________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    final StorageService _storageService = locator<StorageService>();
    // _________________________________________________________________________
    // Decoding the files to Uint8
    Uint8List clinicLogo = await _storageService.getClinicLogoFromLocal();
    String clinicLogoB64 = base64Encode(clinicLogo);
    Uint8List clinicOwnerIdProof =
        await _storageService.getClinicOwnerIdProofFromLocal();
    String clinicOwnerIdProofB64 = base64Encode(clinicOwnerIdProof);
    Uint8List clinicAddressProof =
        await _storageService.getClinicAddressProofFromLocal();
    String clinicAddressProofB64 = base64Encode(clinicAddressProof);

    // _________________________________________________________________________
    try {
      // URL to be calleds
      var uri = Uri.parse('$url$updateClinicImages$clinicId');
      // Creating a get request
      var request = new http.MultipartRequest("PUT", uri);
      // _______________________________________________________________________

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
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      // _______________________________________________________________________
      // Serializing Json to Doctor Class
      print("Clinic Update images with clinic id : " + responseJson.toString());

      // _______________________________________________________________________
      return Clinic.fromJson(responseJson);
    } catch (e) {
      print("At update clinic : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  Future<List<Doctor>> getAllDoctors() async {
    // _______________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // final StorageService _storageService = locator<StorageService>();
    // _______________________________________________________________________
    try {
      // URL to be calleds
      var uri = Uri.parse('$url$urlGetDoctors');
      // Creating a get request
      var request = new http.Request("GET", uri);
      // _______________________________________________________________________

      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      print(responseJson);
      // _______________________________________________________________________
      // Serializing Json to Doctor Class
      List<Doctor> dlist = [];

      responseJson
          .forEach((doctor) => dlist.add(doctorFromJson(json.encode(doctor))));

      // _______________________________________________________________________
      return dlist;
    } catch (e) {
      print("At get all doctors : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return [];
    }
  }

  // ---------------------------------------------------------------------------
  Future<Doctor> getDoctorById(String id) async {
    // _______________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlGetDoctorByID/$id');
      // Creating a get request
      var request = new http.Request("GET", uri);
      // _______________________________________________________________________

      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var resonseJson = json.decode(responseString);
      // _______________________________________________________________________
      return Doctor.fromJson(resonseJson);
    } catch (e) {
      print("At get doctors by Id " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }
  // ---------------------------------------------------------------------------

  Future<dynamic> getAllDoctorCustomers() async {
    // _______________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$getAllDoctorCustomers');
      // Creating a get request
      var request = new http.Request("GET", uri);
      // _______________________________________________________________________

      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var resonseJson = json.decode(responseString);
      // _______________________________________________________________________
      // Serializing Json to Customers Class

      // _______________________________________________________________________

      return dynamic;
    } catch (e) {
      print("At get doctors by Id " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  // ---------------------------------------------------------------------------
  Future addDoctorToClinicById(String id) async {
    // _______________________________________________________________________
    // Locating Dependencies
    final StorageService _storageService = locator<StorageService>();
    final SnackbarService _snackBarService = locator<SnackbarService>();
    final DataFromApi _dataFromApiService = locator<DataFromApi>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$updateDoctor/$id');
      print(uri);
      // Creating a get request
      // var request = new http.MultipartRequest("PUT", uri);
      var request = new http.Request("PUT", uri);
      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      });
      // _______________________________________________________________________
      // Preparing the data to be sent
      request.body = jsonEncode({
        "clinics": {
          "clinic": {
            "_id": _storageService.getClinicId,
            "name": _storageService.getClinicCityName,
            "phoneNumber": _storageService.getPhoneNumber.toString()
          },
        }
      });

      // request..fields['clinics.clinic._id'] = _storageService.getClinicId;
      // request
      //   ..fields['clinics.clinic.name'] = _storageService.getClinicCityName;
      // request
      //   ..fields['clinics.clinic.phoneNumber'] =
      //       _storageService.getPhoneNumber.toString();
      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var resonseJson = json.decode(responseString);
      // _______________________________________________________________________
      // Refetch the updated doctors list from the API
      await _dataFromApiService.setDoctorsList();
      await _dataFromApiService.setDoctorsListForClinic();
      // _______________________________________________________________________
      return doctorFromJson(json.encode(resonseJson));
    } catch (e) {
      print("At add doctors to clinic by Id " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

// ---------------------------------------------------------------------------
  Future addDiagnosticCustomer(dynamic data) async {
    // _______________________________________________________________________
    // Locating Dependencies
    final StorageService _storageService = locator<StorageService>();
    final SnackbarService _snackBarService = locator<SnackbarService>();
    final DataFromApi _dataFromApiService = locator<DataFromApi>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlDiagnosticCustomerCreate');

      // Creating a get request
      // var request = new http.MultipartRequest("PUT", uri);
      var request = new http.Request("PUT", uri);
      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      });
      // _______________________________________________________________________
      // Preparing the data to be sent
      request.body = jsonEncode({
        "clinics": {
          "clinic": {
            "_id": _storageService.getClinicId,
            "name": _storageService.getClinicCityName,
            "phoneNumber": _storageService.getPhoneNumber.toString()
          },
        }
      });

      // request..fields['clinics.clinic._id'] = _storageService.getClinicId;
      // request
      //   ..fields['clinics.clinic.name'] = _storageService.getClinicCityName;
      // request
      //   ..fields['clinics.clinic.phoneNumber'] =
      //       _storageService.getPhoneNumber.toString();
      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var resonseJson = json.decode(responseString);
      // _______________________________________________________________________
      // Refetch the updated doctors list from the API
      await _dataFromApiService.setDoctorsList();
      await _dataFromApiService.setDoctorsListForClinic();
      // _______________________________________________________________________
      return doctorFromJson(json.encode(resonseJson));
    } catch (e) {
      print("At add doctors to clinic by Id " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }
}
