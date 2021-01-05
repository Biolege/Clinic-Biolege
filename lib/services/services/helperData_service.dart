// Helper class used while creating a new doctor's patient
class PatientDetails {
  // __________________________________________________________________________
  static String _doctorsPatientPhoneNumber;
  String getDoctorsPatientPhoneNumber() => _doctorsPatientPhoneNumber;
  void setDoctorsPatientPhoneNumber(String phone) =>
      _doctorsPatientPhoneNumber = phone;

  static String _doctorsPatientName;
  String getDoctorsPatientName() => _doctorsPatientName;
  void setDoctorsPatientName(String name) => _doctorsPatientName = name;

  static DateTime _doctorsPatientDob;
  DateTime getDoctorsPatientDob() => _doctorsPatientDob;
  void setDoctorsPatientDob(DateTime dob) => _doctorsPatientDob = dob;

  static String _doctorsPatientGender;
  String getDoctorsPatientGender() => _doctorsPatientGender;
  void setDoctorsPatientGender(String gender) => _doctorsPatientGender = gender;

  static int _doctorsPatientAge;
  int getDoctorsPatientAge() => _doctorsPatientAge;
  void setDoctorsPatientAge(int age) => _doctorsPatientAge = age;

  static String _doctorsPatientBloodGroup;
  String getDoctorsPatientBloodGroup() => _doctorsPatientBloodGroup;
  void setDoctorsPatientBloodGroup(String blood) =>
      _doctorsPatientBloodGroup = blood;

  static String _doctorsPatientStateName;
  String getDoctorsPatientStateName() => _doctorsPatientStateName;
  void setDoctorsPatientStateName(String state) =>
      _doctorsPatientStateName = state;

  static String _doctorsPatientCityName;
  String getDoctorsPatientCityName() => _doctorsPatientCityName;
  void setDoctorsPatientCityName(String city) => _doctorsPatientCityName = city;

  static String _doctorsPatientPinCode;
  String getDoctorsPatientPinCode() => _doctorsPatientPinCode;
  void setDoctorsPatientPinCode(String pin) => _doctorsPatientPinCode = pin;

  static String _doctorsPatientHomeAddress;
  String getDoctorsPatientHomeAddress() => _doctorsPatientHomeAddress;
  void setDoctorsPatientHomeAddress(String address) =>
      _doctorsPatientHomeAddress = address;

  void resetAllDoctorPatientVariable() {
    _doctorsPatientPhoneNumber = null;
    _doctorsPatientName = null;
    _doctorsPatientDob = null;
    _doctorsPatientGender = null;
    _doctorsPatientAge = null;
    _doctorsPatientBloodGroup = null;
    _doctorsPatientStateName = null;
    _doctorsPatientCityName = null;
    _doctorsPatientPinCode = null;
    _doctorsPatientHomeAddress = null;
  }
  // __________________________________________________________________________
}

// Helper class used when creating a new doctor's customers
class DoctorToShowInAppointmentTab {}
