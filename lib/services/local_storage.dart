import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  // ___________________________________________________________________________
  // User Variables and their getters
  String _name;
  String getName() => _name;
  String _emailAddress;
  String getEmailAddress() => _emailAddress;
  String _gender;
  String getGender() => _gender;
  String _dateOfBirth;
  String getDateOfBirth() => _dateOfBirth;
  String _address;
  String getAddress() => _address;
  String _cityName;
  String getCityName() => _cityName;
  String _pinCode;
  String getPinCode() => _pinCode;
  String _state;
  String getState() => _state;
  String _roleType;
  String getAdminType() => _roleType;
  // ___________________________________________________________________________
  // Clinic Related Variables and their getters
  dynamic _clinicLocationOnMap;
  dynamic getClinicLocationOnMap() => _clinicLocationOnMap;
  String _clinicName;
  String getClinicName() => _clinicName;
  String _clinicAddress;
  String getClinicAddress() => _clinicAddress;
  String _clinicLocation;
  String getClinicLocation() => _clinicLocation;
  String _clinicOwnerName;
  String getClinicOwnerName() => _clinicOwnerName;
  String _clinicPhoneNumber;
  String getClinicPhoneNumber() => _clinicPhoneNumber;
  String _clinicOwnerIdProofType;
  String getClinicOwnerIdProofType() => _clinicOwnerIdProofType;
  File _clinicAddressProof;
  File getClinicAddressIdProof() => _clinicAddressProof;
  File _clinicLogo;
  File getClinicLogo() => _clinicLogo;
  File _clinicOwnerIdProof;
  File getClinicOwnerIdProof() => _clinicOwnerIdProof;
  // ___________________________________________________________________________
  // Setters
  void setName(String name) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _name = name;
    _localStorage.setString("NAME", _name);
  }

  // -------------------------------------------------------------------------
  void setEmailAddress(String emailAddress) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _emailAddress = emailAddress;
    _localStorage.setString("EMAILADDRESS", _emailAddress);
  }

// -------------------------------------------------------------------------
  void setGenderAndDateOfBirth({String gender, String dob}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _gender = gender;
    _dateOfBirth = dob;
    _localStorage.setString("GENDER", _gender);
    _localStorage.setString("DATEOFBIRTH", _dateOfBirth);
  }

// -------------------------------------------------------------------------
  void setAddressDetails(
      {String state, String city, String pinCode, String address}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _address = address;
    _state = state;
    _pinCode = pinCode;
    _cityName = city;
    _localStorage.setString("ADDRESS", _address);
    _localStorage.setString("STATE", _state);
    _localStorage.setString("PINCODE", _pinCode);
    _localStorage.setString("CITYNAME", _cityName);
  }

// -------------------------------------------------------------------------
  void setRoleType(String role) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _roleType = role;
    _localStorage.setString("ROLE", _roleType);
  }

// -------------------------------------------------------------------------
  void setClinicDetails(
      {String clinicName,
      String clinicAddress,
      String clinicLocation,
      dynamic clinicAddressProof,
      dynamic clinicLogo}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _clinicName = clinicName;
    _clinicAddress = clinicAddress;
    _clinicLocation = clinicLocation;
    _clinicAddressProof = clinicAddressProof;
    _clinicLogo = clinicLogo;

    _localStorage.setString("CLINICNAME", _roleType);
    _localStorage.setString("CLINICADDRESS", _roleType);
    _localStorage.setString("CLINICLOCATION", _roleType);
    _localStorage.setString("CLINICADDRESSPROOF", _roleType);
    _localStorage.setString("CLINICLOGO", _roleType);
  }

  // -------------------------------------------------------------------------
  void setClinicDescription(
      {String clinicOwnerName,
      String clinicPhoneNumber,
      String clinicOwnerIdProofType,
      dynamic clinicLocationOnMap,
      File clinicOwnerIdProof}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _clinicOwnerName = clinicOwnerName;
    _clinicPhoneNumber = clinicPhoneNumber;
    _clinicOwnerIdProofType = clinicOwnerIdProofType;
    _clinicOwnerIdProof = clinicOwnerIdProof;
    _clinicLocationOnMap = clinicLocationOnMap;

    _localStorage.setString("CLINICOWNERNAME", _clinicOwnerName);
    _localStorage.setString("CLINICPHONENUMBER", _clinicPhoneNumber);
    _localStorage.setString("CLINICOWNERIDPROOFTYPE", _clinicOwnerIdProofType);
    // _localStorage.setString("CLINICADDRESSPROOF", _clinicOwnerIdProof);
    // _localStorage.setString("CLINICLOCATIONONMAP", _clinicLocationOnMap);
  }
  // -------------------------------------------------------------------------
}
