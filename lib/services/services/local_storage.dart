import 'package:shared_preferences/shared_preferences.dart';
import '../../misc/localKeys/localStorageKeys.dart';

class StorageService {
  // ___________________________________________________________________________
  // User Variables and their getters
  // ------------------------------------------------------------
  int _phoneNumber;
  int getPhoneNumber() => _phoneNumber;
  // ------------------------------------------------------------
  int _roleType;
  int getAdminType() => _roleType;
  // ------------------------------------------------------------
  int _pinCode;
  int getPinCode() => _pinCode;
  // ------------------------------------------------------------
  String _uid;
  String getUID() => _uid;
  // ------------------------------------------------------------
  String _name;
  String getName() => _name;
  // ------------------------------------------------------------
  String _emailAddress;
  String getEmailAddress() => _emailAddress;
  // ------------------------------------------------------------
  String _gender;
  String getGender() => _gender;
  // ------------------------------------------------------------
  String _dateOfBirth;
  String getDateOfBirth() => _dateOfBirth;
  // ------------------------------------------------------------
  String _address;
  String getAddress() => _address;
  // ------------------------------------------------------------
  String _cityName;
  String getCityName() => _cityName;
  // ------------------------------------------------------------
  String _state;
  String getState() => _state;

  String _employeeImage;
  String getEmployeeImage() => _employeeImage;

  // ___________________________________________________________________________
  // Clinic Related Variables and their getters
  // ------------------------------------------------------------
  int _clinicPhoneNumber;
  int getClinicPhoneNumber() => _clinicPhoneNumber;
  // ------------------------------------------------------------
  int _clinicLocationLongitude;
  int getClinicLocationLongitude() => _clinicLocationLongitude;
  // ------------------------------------------------------------
  int _clinicLocationLatitude;
  int getClinicLocationLatitude() => _clinicLocationLatitude;
  // ------------------------------------------------------------
  String _clinicLocationType;
  String getClinicLocationType() => _clinicLocationType;
  // ------------------------------------------------------------
  String _clinicName;
  String getClinicName() => _clinicName;
  // ------------------------------------------------------------
  String _clinicAddress;
  String getClinicAddress() => _clinicAddress;
  // ------------------------------------------------------------
  String _clinicOwnerName;
  String getClinicOwnerName() => _clinicOwnerName;
  // ------------------------------------------------------------
  String _clinicOwnerIdProof;
  String getClinicOwnerIdProof() => _clinicOwnerIdProof;
  // ------------------------------------------------------------
  String _clinicOwnerIdProofType;
  String getClinicOwnerIdProofType() => _clinicOwnerIdProofType;
  // ------------------------------------------------------------
  String _clinicAddressProof;
  String getClinicAddressProof() => _clinicAddressProof;

  String _clinicLogo;
  String getClinicLogo() => _clinicLogo;

  // ___________________________________________________________________________
  // Assign the variables if present

  void initLocalStorages() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    // ------------------------------------------------------------------
    _phoneNumber = _localStorage.getInt(phoneNumberLocalStorageKey);
    // ------------------------------------------------------------------
    _roleType = _localStorage.getInt(roleTypeLocalStorageKey);
    // ------------------------------------------------------------------
    _pinCode = _localStorage.getInt(pinCodeLocalStorageKey);
    // ------------------------------------------------------------------
    _uid = _localStorage.getString(uidLocalStorageKey);
    // ------------------------------------------------------------------
    _name = _localStorage.getString(nameLocalStorageKey);
    // ------------------------------------------------------------------
    _emailAddress = _localStorage.getString(emailAddressLocalStorageKey);
    // ------------------------------------------------------------------
    _gender = _localStorage.getString(genderLocalStorageKey);
    // ------------------------------------------------------------------
    _dateOfBirth = _localStorage.getString(dateOfBirthLocalStorageKey);
    // ------------------------------------------------------------------
    _address = _localStorage.getString(addressLocalStorageKey);
    // ------------------------------------------------------------------
    _cityName = _localStorage.getString(cityNameLocalStorageKey);
    // ------------------------------------------------------------------
    _state = _localStorage.getString(stateLocalStorageKey);
    // ------------------------------------------------------------------
    _employeeImage = _localStorage.getString(employeeImageLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicPhoneNumber = _localStorage.getInt(clinicPhoneNumberLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicLocationLongitude =
        _localStorage.getInt(clinicLocationLongitudeLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicLocationLatitude =
        _localStorage.getInt(clinicLocationLatitudeLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicLocationType =
        _localStorage.getString(clinicLocationTypeLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicName = _localStorage.getString(clinicNameLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicAddress = _localStorage.getString(clinicAddressLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicOwnerName = _localStorage.getString(clinicOwnerNameLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicOwnerIdProof =
        _localStorage.getString(clinicOwnerIdProofLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicOwnerIdProofType =
        _localStorage.getString(clinicOwnerIdProofTypeLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicAddressProof =
        _localStorage.getString(clinicAddressProofLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicLogo = _localStorage.getString(clinicLogoLocalStorageKey);
    // ------------------------------------------------------------------
  }

  // ___________________________________________________________________________
  // Setters
  Future setPhoneNumber(int phone) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _phoneNumber = phone;
    await _localStorage.setInt(phoneNumberLocalStorageKey, _phoneNumber);
  }

  Future setUID(String uid) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _uid = uid;
    await _localStorage.setString(roleTypeLocalStorageKey, _uid);
  }

  Future setName(String name) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _name = name;
    await _localStorage.setString(nameLocalStorageKey, _name);
  }

  // -------------------------------------------------------------------------
  Future setEmailAddress(String emailAddress) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _emailAddress = emailAddress;
    await _localStorage.setString(emailAddressLocalStorageKey, _emailAddress);
  }

// -------------------------------------------------------------------------
  Future setGenderAndDateOfBirth({String gender, String dob}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _gender = gender;
    _dateOfBirth = dob;
    await _localStorage.setString(genderLocalStorageKey, _gender);
    await _localStorage.setString(dateOfBirthLocalStorageKey, _dateOfBirth);
  }

// -------------------------------------------------------------------------
  Future setAddressDetails(
      {String state, String city, int pinCode, String address}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _address = address;
    _state = state;
    _pinCode = pinCode;
    _cityName = city;
    await _localStorage.setString(addressLocalStorageKey, _address);
    await _localStorage.setString(stateLocalStorageKey, _state);
    await _localStorage.setInt(pinCodeLocalStorageKey, _pinCode);
    await _localStorage.setString(cityNameLocalStorageKey, _cityName);
  }

// -------------------------------------------------------------------------
  Future setRoleType(int role) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _roleType = role;
    _localStorage.setInt(roleTypeLocalStorageKey, _roleType);
  }
  // -------------------------------------------------------------------------

  Future setEmployeeImage(String imageUrl) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _employeeImage = imageUrl;
    await _localStorage.setString(employeeImageLocalStorageKey, _employeeImage);
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

    await _localStorage.setString(clinicNameLocalStorageKey, _clinicName);
    await _localStorage.setString(clinicAddressLocalStorageKey, _clinicAddress);
    await _localStorage.setString(
        clinicLocationTypeLocalStorageKey, clinicLocationType);
    await _localStorage.setString(
        clinicAddressProofLocalStorageKey, _clinicAddressProof);
    await _localStorage.setString(clinicLogoLocalStorageKey, _clinicLogo);
  }

  // -------------------------------------------------------------------------
  Future setClinicDescription({
    String clinicOwnerName,
    String clinicOwnerIdProofType,
    String clinicOwnerIdProof,
    int clinicPhoneNumber,
    int clinicLocationLongitude,
    int clinicLocationLatitude,
  }) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _clinicOwnerName = clinicOwnerName;
    _clinicPhoneNumber = clinicPhoneNumber;
    _clinicOwnerIdProofType = clinicOwnerIdProofType;
    _clinicOwnerIdProof = clinicOwnerIdProof;

    await _localStorage.setString(
        clinicOwnerNameLocalStorageKey, _clinicOwnerName);
    await _localStorage.setInt(
        clinicPhoneNumberLocalStorageKey, _clinicPhoneNumber);
    await _localStorage.setInt(
        clinicLocationLongitudeLocalStorageKey, _clinicLocationLongitude);
    await _localStorage.setInt(
        clinicLocationLatitudeLocalStorageKey, _clinicLocationLatitude);
    await _localStorage.setString(
        clinicOwnerIdProofLocalStorageKey, _clinicOwnerIdProof);
    await _localStorage.setString(
        clinicOwnerIdProofTypeLocalStorageKey, _clinicOwnerIdProofType);
  }
  // -------------------------------------------------------------------------

// _____________________________________________________________________________
// Getters from Local
  Future<int> getPhoneNumberFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(phoneNumberLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getEmployeeImageFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(employeeImageLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getUIDFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(uidLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(nameLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getEmailAddressFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(emailAddressLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getGenderFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(genderLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getDateOfBirthFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(dateOfBirthLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getAddressFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(addressLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getStateFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(stateLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<int> getPinCodeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(pinCodeLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getCityNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(cityNameLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<int> getRoleTypeFromLocal(int role) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(roleTypeLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getClinicNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(cityNameLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getClinicAddressFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicAddressLocalStorageKey);
  }

  Future<String> getClinicLocationTypeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicLocationTypeLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getClinicAddressProofFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicAddressProofLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getClinicLogoFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicLogoLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<String> getClinicOwnerNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicOwnerNameLocalStorageKey);
  }
// -------------------------------------------------------------------------

  Future<int> getClinicPhoneNumberFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(clinicPhoneNumberLocalStorageKey);
  }
// -------------------------------------------------------------------------

  Future<int> getClinicLocationLongitudeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(clinicLocationLongitudeLocalStorageKey);
  }

// -------------------------------------------------------------------------
  Future<int> getClinicLocationLatitudeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(clinicLocationLatitudeLocalStorageKey);
  }
// -------------------------------------------------------------------------

  Future<String> getClinicOwnerIdProofTypeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicOwnerIdProofTypeLocalStorageKey);
  }

// _____________________________________________________________________________
// Getter for all user details from local
  Future<Map<String, String>> getAllUserDetailsFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return {
      // ------------------------------------------------------------------
      nameLocalStorageKey: _localStorage.getString(nameLocalStorageKey),
      // ------------------------------------------------------------------
      phoneNumberLocalStorageKey:
          _localStorage.getInt(phoneNumberLocalStorageKey).toString(),
      // ------------------------------------------------------------------
      emailAddressLocalStorageKey:
          _localStorage.getString(emailAddressLocalStorageKey),
      // ------------------------------------------------------------------
      genderLocalStorageKey: _localStorage.getString(genderLocalStorageKey),
      // ------------------------------------------------------------------
      dateOfBirthLocalStorageKey:
          _localStorage.getString(dateOfBirthLocalStorageKey),
      // ------------------------------------------------------------------
      addressLocalStorageKey: _localStorage.getString(addressLocalStorageKey),
      // ------------------------------------------------------------------
      stateLocalStorageKey: _localStorage.getString(stateLocalStorageKey),
      // ------------------------------------------------------------------
      pinCodeLocalStorageKey:
          _localStorage.getInt(pinCodeLocalStorageKey).toString(),
      // ------------------------------------------------------------------
      cityNameLocalStorageKey: _localStorage.getString(cityNameLocalStorageKey),
      // ------------------------------------------------------------------
      roleTypeLocalStorageKey:
          _localStorage.getInt(roleTypeLocalStorageKey).toString(),
      // ------------------------------------------------------------------
      employeeImageLocalStorageKey:
          _localStorage.getString(employeeImageLocalStorageKey)
    };
  }

// _____________________________________________________________________________
// Getter for all clinic details from local
  Future<Map<String, String>> getAllClinicDetailsFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return {
      // ------------------------------------------------------------------
      clinicNameLocalStorageKey:
          _localStorage.getString(clinicNameLocalStorageKey),
      // ------------------------------------------------------------------
      clinicAddressLocalStorageKey:
          _localStorage.getString(clinicAddressLocalStorageKey),
      // ------------------------------------------------------------------
      clinicLocationTypeLocalStorageKey:
          _localStorage.getString(clinicLocationTypeLocalStorageKey),
      // ------------------------------------------------------------------
      clinicAddressProofLocalStorageKey:
          _localStorage.getString(clinicAddressProofLocalStorageKey),
      // ------------------------------------------------------------------
      clinicLogoLocalStorageKey:
          _localStorage.getString(clinicLogoLocalStorageKey),
      // ------------------------------------------------------------------
      clinicOwnerNameLocalStorageKey:
          _localStorage.getString(clinicOwnerNameLocalStorageKey),
      // ------------------------------------------------------------------
      clinicPhoneNumberLocalStorageKey:
          _localStorage.getInt(clinicPhoneNumberLocalStorageKey).toString(),
      // ------------------------------------------------------------------
      clinicLocationLongitudeLocalStorageKey: _localStorage
          .getInt(clinicLocationLongitudeLocalStorageKey)
          .toString(),
      // ------------------------------------------------------------------
      clinicLocationLatitudeLocalStorageKey: _localStorage
          .getInt(clinicLocationLatitudeLocalStorageKey)
          .toString(),
      // ------------------------------------------------------------------
      clinicOwnerIdProofLocalStorageKey:
          _localStorage.getString(clinicOwnerIdProofLocalStorageKey),
      // ------------------------------------------------------------------
      _clinicOwnerIdProofType: _localStorage.getString(_clinicOwnerIdProofType),
      // ------------------------------------------------------------------
    };
  }
  // ___________________________________________________________________________
}
