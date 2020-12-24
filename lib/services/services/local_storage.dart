import 'package:shared_preferences/shared_preferences.dart';
import '../../misc/localKeys/localStorageKeys.dart';

class StorageService {
  // ___________________________________________________________________________
  // User Variables and their getters
  // ...........................................................................
  String _employeeImage;
  String get getEmployeeImage => _employeeImage;
  // ------------------------------------------------------------
  int _phoneNumber;
  int get getPhoneNumber => _phoneNumber;
  // ------------------------------------------------------------
  String _uid;
  String get getUID => _uid;
  // ...........................................................................
  String _name;
  String get getName => _name;
  // ...........................................................................
  String _emailAddress;
  String get getEmailAddress => _emailAddress;
  // ...........................................................................
  String _gender;
  String get getGender => _gender;
  // ------------------------------------------------------------
  String _dateOfBirth;
  String get getDateOfBirth => _dateOfBirth;
  // ...........................................................................

  String _state;
  String get getState => _state;
  // ------------------------------------------------------------
  String _cityName;
  String get getCityName => _cityName;
  // ------------------------------------------------------------
  int _pinCode;
  int get getPinCode => _pinCode;
  // ------------------------------------------------------------
  String _address;
  String get getAddress => _address;
  // ...........................................................................
  int _roleType;
  int get getRoleType => _roleType;
  // ...........................................................................

  // ___________________________________________________________________________
  // Clinic Related Variables and their getters
  // ------------------------------------------------------------

  String _clinicName;
  // ...........................................................................
  String get getClinicName => _clinicName;
// ------------------------------------------------------------
  int _clinicPhoneNumber;
  int get getClinicPhoneNumber => _clinicPhoneNumber;
  // ------------------------------------------------------------
  String _clinicLocationType;
  String get getClinicLocationType => _clinicLocationType;
  // ------------------------------------------------------------
  String _clinicLogo;
  String get getClinicLogo => _clinicLogo;
  // ...........................................................................
  String _clinicStateName;
  String get getClinicStateName => _clinicStateName;
  // ------------------------------------------------------------
  String _clinicCityName;
  String get getClinicCityName => _clinicCityName;
  // ------------------------------------------------------------
  String _clinicAddress;
  String get getClinicAddress => _clinicAddress;
  // ------------------------------------------------------------
  String _clinicPinCode;
  String get getClinicPinCode => _clinicPinCode;
  // ------------------------------------------------------------
  String _clinicAddressProof;
  String get getClinicAddressProof => _clinicAddressProof;
  // ...........................................................................
  String _clinicOwnerName;
  String get getClinicOwnerName => _clinicOwnerName;
  // ------------------------------------------------------------
  int _clinicOwnerPhoneNumber;
  int get getClinicPhone => _clinicOwnerPhoneNumber;
  // ------------------------------------------------------------
  String _clinicOwnerIdProofType;
  String get getClinicOwnerIdProofType => _clinicOwnerIdProofType;
  // ------------------------------------------------------------
  String _clinicOwnerIdProof;
  String get getClinicOwnerIdProof => _clinicOwnerIdProof;
  // ------------------------------------------------------------
  int _clinicLocationLongitude;
  int get getClinicLocationLongitude => _clinicLocationLongitude;
  // ------------------------------------------------------------
  int _clinicLocationLatitude;
  int get getClinicLocationLatitude => _clinicLocationLatitude;
  // ...........................................................................

  // ___________________________________________________________________________
  // Assign the variables if present

  Future<void> initLocalStorages() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    // .........................................................................
    _uid = _localStorage.getString(uidLocalStorageKey);
    // ------------------------------------------------------------------
    _phoneNumber = _localStorage.getInt(phoneNumberLocalStorageKey);
    // .........................................................................
    _name = _localStorage.getString(nameLocalStorageKey);
    // .........................................................................
    _emailAddress = _localStorage.getString(emailAddressLocalStorageKey);
    // .........................................................................
    _gender = _localStorage.getString(genderLocalStorageKey);
    // ------------------------------------------------------------------
    _dateOfBirth = _localStorage.getString(dateOfBirthLocalStorageKey);
    // .........................................................................
    _state = _localStorage.getString(stateLocalStorageKey);
    // ------------------------------------------------------------------
    _cityName = _localStorage.getString(cityNameLocalStorageKey);
    // ------------------------------------------------------------------
    _pinCode = _localStorage.getInt(pinCodeLocalStorageKey);
    // ------------------------------------------------------------------
    _address = _localStorage.getString(addressLocalStorageKey);
    // .........................................................................
    _roleType = _localStorage.getInt(roleTypeLocalStorageKey);
    // .........................................................................
    _employeeImage = _localStorage.getString(employeeImageLocalStorageKey);
    // .........................................................................
    _clinicName = _localStorage.getString(clinicNameLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicPhoneNumber = _localStorage.getInt(clinicPhoneNumberLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicLocationType =
        _localStorage.getString(clinicLocationTypeLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicLogo = _localStorage.getString(clinicLogoLocalStorageKey);
    // .........................................................................
    _clinicStateName = _localStorage.getString(clinicStateNameLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicCityName = _localStorage.getString(clinicCityNameLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicAddress = _localStorage.getString(clinicAddressLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicPinCode = _localStorage.getString(clinicPinCodeLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicAddressProof =
        _localStorage.getString(clinicAddressProofLocalStorageKey);
    // .........................................................................
    _clinicOwnerName = _localStorage.getString(clinicOwnerNameLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicOwnerPhoneNumber =
        _localStorage.getInt(clinicOwnerPhoneLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicOwnerIdProofType =
        _localStorage.getString(clinicOwnerIdProofTypeLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicOwnerIdProof =
        _localStorage.getString(clinicOwnerIdProofLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicLocationLongitude =
        _localStorage.getInt(clinicLocationLongitudeLocalStorageKey);
    // ------------------------------------------------------------------
    _clinicLocationLatitude =
        _localStorage.getInt(clinicLocationLatitudeLocalStorageKey);
    //.........................................................................
  }

  // ___________________________________________________________________________
  // Setters into local
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

  // ...........................................................................
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

// ...........................................................................
  Future setGenderAndDateOfBirth({String gender, String dob}) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _gender = gender;
    _dateOfBirth = dob;
    await _localStorage.setString(genderLocalStorageKey, _gender);
    await _localStorage.setString(dateOfBirthLocalStorageKey, _dateOfBirth);
  }

// ...........................................................................
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

// ...........................................................................
  Future setRoleType(int role) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _roleType = role;
    _localStorage.setInt(roleTypeLocalStorageKey, _roleType);
  }
  // ...........................................................................

  Future setEmployeeImage(String imageUrl) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _employeeImage = imageUrl;
    await _localStorage.setString(employeeImageLocalStorageKey, _employeeImage);
  }

// ...........................................................................
  Future setClinicDetails({
    String clinicName,
    int clinicPhone,
    String clinicLocationType,
    String clinicLogo,
  }) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();

    _clinicName = clinicName;
    _clinicPhoneNumber = clinicPhone;
    _clinicLocationType = clinicLocationType;
    _clinicLogo = clinicLogo;

    await _localStorage.setString(clinicNameLocalStorageKey, _clinicName);
    await _localStorage.setInt(
        clinicPhoneNumberLocalStorageKey, _clinicPhoneNumber);
    await _localStorage.setString(
        clinicLocationTypeLocalStorageKey, _clinicLocationType);
    await _localStorage.setString(clinicLogoLocalStorageKey, _clinicLogo);
  }

// ...........................................................................
  Future setClinicDescription({
    String clinicStateName,
    String clinicCityName,
    String clinicAddress,
    String clinicPinCode,
    String clinicAddressProof,
  }) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();

    _clinicStateName = clinicStateName;
    _clinicCityName = clinicCityName;
    _clinicAddress = clinicAddress;
    _clinicPinCode = clinicPinCode;
    _clinicAddressProof = clinicAddressProof;

    await _localStorage.setString(
        clinicStateNameLocalStorageKey, _clinicStateName);
    await _localStorage.setString(
        clinicCityNameLocalStorageKey, _clinicCityName);
    await _localStorage.setString(clinicAddressLocalStorageKey, _clinicAddress);
    await _localStorage.setString(clinicPinCodeLocalStorageKey, _clinicPinCode);
    await _localStorage.setString(
        clinicAddressProofLocalStorageKey, _clinicAddressProof);
  }

  // ...........................................................................
  Future setClinicOwnerDetails({
    String clinicOwnerName,
    int clinicOwnerPhoneNumber,
    String clinicOwnerIdProofType,
    String clinicOwnerIdProof,
    int clinicLocationLongitude,
    int clinicLocationLatitude,
  }) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    _clinicOwnerName = clinicOwnerName;
    _clinicOwnerPhoneNumber = clinicOwnerPhoneNumber;
    _clinicOwnerIdProofType = clinicOwnerIdProofType;
    _clinicOwnerIdProof = clinicOwnerIdProof;

    await _localStorage.setString(
        clinicOwnerNameLocalStorageKey, _clinicOwnerName);
    await _localStorage.setInt(
        clinicOwnerPhoneLocalStorageKey, _clinicOwnerPhoneNumber);
    await _localStorage.setInt(
        clinicLocationLongitudeLocalStorageKey, _clinicLocationLongitude);
    await _localStorage.setInt(
        clinicLocationLatitudeLocalStorageKey, _clinicLocationLatitude);
    await _localStorage.setString(
        clinicOwnerIdProofLocalStorageKey, _clinicOwnerIdProof);
    await _localStorage.setString(
        clinicOwnerIdProofTypeLocalStorageKey, _clinicOwnerIdProofType);
  }

  // ...........................................................................
  Future setClinicOwnerDescription({
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
  // ...........................................................................

// _____________________________________________________________________________
// Individual Getters from Local
//..............................................................................
  Future<int> getPhoneNumberFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(phoneNumberLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getUIDFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(uidLocalStorageKey);
  }

// .............................................................................
  Future<String> getEmployeeImageFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(employeeImageLocalStorageKey);
  }

// .............................................................................
  Future<String> getNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(nameLocalStorageKey);
  }

// .............................................................................
  Future<String> getEmailAddressFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(emailAddressLocalStorageKey);
  }

// .............................................................................
  Future<String> getGenderFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(genderLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getDateOfBirthFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(dateOfBirthLocalStorageKey);
  }

// .............................................................................

  Future<String> getStateFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(stateLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getCityNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(cityNameLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<int> getPinCodeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(pinCodeLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getAddressFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(addressLocalStorageKey);
  }

// .............................................................................
  Future<int> getRoleTypeFromLocal(int role) async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(roleTypeLocalStorageKey);
  }

// .............................................................................
  Future<String> getClinicNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(cityNameLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getClinicPhoneNumberFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicPhoneNumberLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getClinicLocationTypeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicLocationTypeLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getClinicLogoFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicLogoLocalStorageKey);
  }

// .............................................................................
  Future<String> getClinicStateNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicStateNameLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getClinicCityNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicCityNameLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getClinicAddressFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicAddressLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getClinicPinCodeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicAddressLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<String> getClinicAddressProofFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicAddressProofLocalStorageKey);
  }

// .............................................................................
  Future<String> getClinicOwnerNameFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicOwnerNameLocalStorageKey);
  }
// ---------------------------------------------------------------

  Future<int> getClinicOwnerPhoneNumberFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(clinicOwnerPhoneLocalStorageKey);
  }
// ---------------------------------------------------------------

  Future<String> getClinicOwnerIdProofTypeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicOwnerIdProofTypeLocalStorageKey);
  }
// ---------------------------------------------------------------

  Future<String> getClinicOwnerIdProofFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getString(clinicOwnerIdProofLocalStorageKey);
  }
// ---------------------------------------------------------------

  Future<int> getClinicLocationLongitudeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(clinicLocationLongitudeLocalStorageKey);
  }

// ---------------------------------------------------------------
  Future<int> getClinicLocationLatitudeFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return _localStorage.getInt(clinicLocationLatitudeLocalStorageKey);
  }

// .............................................................................
// _____________________________________________________________________________
// Getter for all user details from local
  Future<Map<String, String>> getAllUserDetailsFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return {
      // .......................................................................
      uidLocalStorageKey:
          _localStorage.getString(uidLocalStorageKey).toString(),
      // -------------------------------------------------------------
      phoneNumberLocalStorageKey:
          _localStorage.getInt(phoneNumberLocalStorageKey).toString(),
      // .......................................................................
      nameLocalStorageKey: _localStorage.getString(nameLocalStorageKey),
      // .......................................................................
      emailAddressLocalStorageKey:
          _localStorage.getString(emailAddressLocalStorageKey),
      // .......................................................................
      genderLocalStorageKey: _localStorage.getString(genderLocalStorageKey),
      // -------------------------------------------------------------
      dateOfBirthLocalStorageKey:
          _localStorage.getString(dateOfBirthLocalStorageKey),
      // .......................................................................
      stateLocalStorageKey: _localStorage.getString(stateLocalStorageKey),
      // -------------------------------------------------------------
      cityNameLocalStorageKey: _localStorage.getString(cityNameLocalStorageKey),
      // -------------------------------------------------------------
      pinCodeLocalStorageKey:
          _localStorage.getInt(pinCodeLocalStorageKey).toString(),
      // -------------------------------------------------------------
      addressLocalStorageKey: _localStorage.getString(addressLocalStorageKey),
      // .......................................................................
      roleTypeLocalStorageKey:
          _localStorage.getInt(roleTypeLocalStorageKey).toString(),
      // .......................................................................
      employeeImageLocalStorageKey:
          _localStorage.getString(employeeImageLocalStorageKey)
      // .......................................................................
    };
  }

// _____________________________________________________________________________
// Getter for all clinic details from local
  Future<Map<String, String>> getAllClinicDetailsFromLocal() async {
    SharedPreferences _localStorage = await SharedPreferences.getInstance();
    return {
      // .......................................................................
      clinicNameLocalStorageKey:
          _localStorage.getString(clinicNameLocalStorageKey),
      // ------------------------------------------------------------------
      clinicPhoneNumberLocalStorageKey:
          _localStorage.getInt(clinicPhoneNumberLocalStorageKey).toString(),
      // ------------------------------------------------------------------
      clinicLocationTypeLocalStorageKey:
          _localStorage.getString(clinicLocationTypeLocalStorageKey),
      // ------------------------------------------------------------------
      clinicLogoLocalStorageKey:
          _localStorage.getString(clinicLogoLocalStorageKey),
      // .......................................................................
      clinicStateNameLocalStorageKey:
          _localStorage.getString(clinicStateNameLocalStorageKey),
      // ------------------------------------------------------------------
      clinicCityNameLocalStorageKey:
          _localStorage.getString(clinicCityNameLocalStorageKey),
      // ------------------------------------------------------------------
      clinicAddressLocalStorageKey:
          _localStorage.getString(clinicAddressLocalStorageKey),
      // ------------------------------------------------------------------
      clinicPinCodeLocalStorageKey:
          _localStorage.getString(clinicPinCodeLocalStorageKey),
      // ------------------------------------------------------------------
      clinicAddressProofLocalStorageKey:
          _localStorage.getString(clinicAddressProofLocalStorageKey),
      // .......................................................................
      clinicOwnerNameLocalStorageKey:
          _localStorage.getString(clinicOwnerNameLocalStorageKey),

      // ------------------------------------------------------------------
      clinicOwnerPhoneLocalStorageKey:
          _localStorage.getString(clinicOwnerPhoneLocalStorageKey),

      // ------------------------------------------------------------------
      clinicOwnerIdProofTypeLocalStorageKey:
          _localStorage.getString(clinicOwnerIdProofTypeLocalStorageKey),
      // ------------------------------------------------------------------
      clinicOwnerIdProofLocalStorageKey:
          _localStorage.getString(clinicOwnerIdProofLocalStorageKey),
      // ------------------------------------------------------------------
      clinicLocationLongitudeLocalStorageKey: _localStorage
          .getInt(clinicLocationLongitudeLocalStorageKey)
          .toString(),
      // ------------------------------------------------------------------
      clinicLocationLatitudeLocalStorageKey: _localStorage
          .getInt(clinicLocationLatitudeLocalStorageKey)
          .toString(),
      // .......................................................................
    };
  }
  // ___________________________________________________________________________
}