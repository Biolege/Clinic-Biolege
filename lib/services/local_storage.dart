import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // ___________________________________________________________________________
  // User Variables and their getters

  int _phoneNumber;
  int _roleType;
  int _pinCode;
  String _uid;
  String _name;
  String _emailAddress;
  String _gender;
  String _dateOfBirth;
  String _address;
  String _cityName;
  String _employeeImage;
  String _state;

  int getPhoneNumber() => _phoneNumber;
  int getAdminType() => _roleType;
  int getPinCode() => _pinCode;
  String getUID() => _uid;
  String getEmployeeImage() => _employeeImage;
  String getName() => _name;
  String getEmailAddress() => _emailAddress;
  String getGender() => _gender;
  String getDateOfBirth() => _dateOfBirth;
  String getAddress() => _address;
  String getCityName() => _cityName;
  String getState() => _state;

  // ___________________________________________________________________________
  // Clinic Related Variables and their getters

  int _clinicPhoneNumber;
  int _clinicLocationLongitude;
  int _clinicLocationLatitude;
  String _clinicLocationType;
  String _clinicName;
  String _clinicAddress;
  String _clinicOwnerName;
  String _clinicOwnerIdProofType;
  File _clinicAddressProof;
  File _clinicLogo;
  File _clinicOwnerIdProof;

  String getClinicLocationType() => _clinicLocationType;
  String getClinicName() => _clinicName;
  String getClinicAddress() => _clinicAddress;
  String getClinicOwnerName() => _clinicOwnerName;
  int getClinicPhoneNumber() => _clinicPhoneNumber;
  String getClinicOwnerIdProofType() => _clinicOwnerIdProofType;
  int getClinicLocationLongitude() => _clinicLocationLongitude;
  int getClinicLocationLatitude() => _clinicLocationLatitude;
  File getClinicAddressIdProof() => _clinicAddressProof;
  File getClinicLogo() => _clinicLogo;
  File getClinicOwnerIdProof() => _clinicOwnerIdProof;
  // ___________________________________________________________________________
  // Setters
  Future setPhoneNumber(int phone) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _phoneNumber = phone;
    await _localStorage.setInt("PHONE", _phoneNumber);
  }

  Future setUID(String uid) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _uid = uid;
    await _localStorage.setString("UID", _uid);
  }

  Future setEmployeeImage(String imageUrl) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _employeeImage = imageUrl;
    await _localStorage.setString("EMPLOYEEIMAGE", _employeeImage);
  }

  Future setName(String name) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _name = name;
    await _localStorage.setString("NAME", _name);
  }

  // -------------------------------------------------------------------------
  Future setEmailAddress(String emailAddress) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _emailAddress = emailAddress;
    await _localStorage.setString("EMAILADDRESS", _emailAddress);
  }

// -------------------------------------------------------------------------
  Future setGenderAndDateOfBirth({String gender, String dob}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _gender = gender;
    _dateOfBirth = dob;
    await _localStorage.setString("GENDER", _gender);
    await _localStorage.setString("DATEOFBIRTH", _dateOfBirth);
  }

// -------------------------------------------------------------------------
  Future setAddressDetails(
      {String state, String city, int pinCode, String address}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _address = address;
    _state = state;
    _pinCode = pinCode;
    _cityName = city;
    await _localStorage.setString("ADDRESS", _address);
    await _localStorage.setString("STATE", _state);
    await _localStorage.setInt("PINCODE", _pinCode);
    await _localStorage.setString("CITYNAME", _cityName);
  }

// -------------------------------------------------------------------------
  Future setRoleType(int role) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _roleType = role;
    _localStorage.setInt("ROLE", _roleType);
  }

// -------------------------------------------------------------------------
  Future setClinicDetails(
      {String clinicName,
      String clinicAddress,
      String clinicLocationType,
      dynamic clinicAddressProof,
      dynamic clinicLogo}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();

    _clinicName = clinicName;
    _clinicAddress = clinicAddress;
    _clinicLocationType = clinicLocationType;
    _clinicAddressProof = clinicAddressProof;
    _clinicLogo = clinicLogo;

    await _localStorage.setString("CLINICNAME", _clinicName);
    await _localStorage.setString("CLINICADDRESS", _clinicAddress);
    await _localStorage.setString("CLINICLOCATIONTYPE", clinicLocationType);
    // _localStorage.setString("CLINICADDRESSPROOF", _clinicAddressProof);
    // _localStorage.setString("CLINICLOGO", _clinicLogo);
  }

  // -------------------------------------------------------------------------
  Future setClinicDescription(
      {String clinicOwnerName,
      String clinicOwnerIdProofType,
      int clinicPhoneNumber,
      int clinicLocationLongitude,
      int clinicLocationLatitude,
      File clinicOwnerIdProof}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _clinicOwnerName = clinicOwnerName;
    _clinicPhoneNumber = clinicPhoneNumber;
    _clinicOwnerIdProofType = clinicOwnerIdProofType;
    _clinicOwnerIdProof = clinicOwnerIdProof;

    await _localStorage.setString("CLINICOWNERNAME", _clinicOwnerName);
    _localStorage.setInt("CLINICPHONENUMBER", _clinicPhoneNumber);
    await _localStorage.setInt(
        "CLINICLOCATIONLONGITUDE", _clinicLocationLongitude);
    await _localStorage.setInt(
        "CLINICLOCATIONLATITUDE", _clinicLocationLatitude);
    await _localStorage.setString(
        "CLINICOWNERIDPROOFTYPE", _clinicOwnerIdProofType);
    // _localStorage.setString("CLINICADDRESSPROOF", _clinicOwnerIdProof);
  }
  // -------------------------------------------------------------------------
}

// ___________________________________________________________________________
// Getters
Future<int> getPhoneNumber() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getInt("PHONE");
}

// -------------------------------------------------------------------------
Future<String> getEmployeeImage() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("EMPLOYEEIMAGE");
}

// -------------------------------------------------------------------------
Future<String> getUID() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("UID");
}

// -------------------------------------------------------------------------
Future<String> getName() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("NAME");
}

// -------------------------------------------------------------------------
Future<String> getEmailAddress() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("EMAILADDRESS");
}

// -------------------------------------------------------------------------
Future<String> getGender() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("GENDER");
}

// -------------------------------------------------------------------------
Future<String> getDateOfBirth() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("DATEOFBIRTH");
}

// -------------------------------------------------------------------------
Future<String> getAddress() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("ADDRESS");
}

// -------------------------------------------------------------------------
Future<String> getState() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("STATE");
}

// -------------------------------------------------------------------------
Future<String> getPinCode() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("PINCODE");
}

// -------------------------------------------------------------------------
Future<String> getCityName() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("CITYNAME");
}

// -------------------------------------------------------------------------
Future<int> getRoleType(int role) async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getInt("ROLE");
}

// -------------------------------------------------------------------------
Future<String> getClinicName() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("CLINICNAME");
}

// -------------------------------------------------------------------------
Future<String> getClinicAddress() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("CLINICADDRESS");
}

Future<String> getClinicLocationType() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("CLINICLOCATIONTYPE");
}
// -------------------------------------------------------------------------
// Future<String> getClinicAddressProof() async {
//   SharedPreferences _localStorage = await SharedPreferences.getInstance();
//   return _localStorage.getString("CLINICADDRESSPROOF");
// }

// -------------------------------------------------------------------------
// Future<String> getClinicLogo() async {
//   SharedPreferences _localStorage = await SharedPreferences.getInstance();
//   return _localStorage.getString("CLINICLOGO");
// }

// -------------------------------------------------------------------------
Future<String> getClinicOwnerName() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getString("CLINICOWNERNAME");
} // -------------------------------------------------------------------------

Future<int> getClinicPhoneNumber() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getInt("CLINICPHONENUMBER");
}
// -------------------------------------------------------------------------

Future<int> getClinicLocationLongitude() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getInt("CLINICLOCATIONLONGITUDE");
}

// -------------------------------------------------------------------------
Future<int> getClinicLocationLatitude() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return _localStorage.getInt("CLINICLOCATIONLATITUDE");
}
// -------------------------------------------------------------------------

// Future<String> getClinicOwnerIdProofType() async {
//   SharedPreferences _localStorage = await SharedPreferences.getInstance();
//   return _localStorage.getString("CLINICOWNERIDPROOFTYPE");
// }

// ___________________________________________________________________________
// Getter for all details
Future<Map<String, String>> getAllUserDetailsFromDisk() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return {
    "NAME": _localStorage.getString("NAME"),
    "PHONE": _localStorage.getInt("PHONE").toString(),
    "EMAILADDRESS": _localStorage.getString("EMAILADDRESS"),
    "GENDER": _localStorage.getString("GENDER"),
    "DATEOFBIRTH": _localStorage.getString("DATEOFBIRTH"),
    "ADDRESS": _localStorage.getString("ADDRESS"),
    "STATE": _localStorage.getString("STATE"),
    "PINCODE": _localStorage.getInt("PINCODE").toString(),
    "CITYNAME": _localStorage.getString("CITYNAME"),
    "ROLE": _localStorage.getInt("ROLE").toString(),
    "EMPLOYEEIMAGE": _localStorage.getString("EMPLOYEEIMAGE")
  };
}

// Getter for all clinic details
Future<Map<String, String>> getAllClinicDetailsFromDisk() async {
  SharedPreferences _localStorage = await SharedPreferences.getInstance();
  return {
    "CLINICNAME": _localStorage.getString("CLINICNAME"),
    "CLINICADDRESS": _localStorage.getString("CLINICADDRESS"),
    "CLINICLOCATIONTYPE": _localStorage.getString("CLINICLOCATIONTYPE"),
    // "CLINICADDRESSPROOF": _localStorage.getString("CLINICADDRESSPROOF"),
    // "CLINICLOGO": _localStorage.getString("CLINICLOGO"),
    "CLINICOWNERNAME": _localStorage.getString("CLINICOWNERNAME"),
    "CLINICPHONENUMBER": _localStorage.getInt("CLINICPHONENUMBER").toString(),
    "CLINICLOCATIONLONGITUDE":
        _localStorage.getInt("CLINICLOCATIONLONGITUDE").toString(),
    "CLINICLOCATIONLATITUDE":
        _localStorage.getInt("CLINICLOCATIONLATITUDE").toString(),
    "CLINICOWNERIDPROOFTYPE": _localStorage.getString("CLINICOWNERIDPROOFTYPE"),
  };
}
