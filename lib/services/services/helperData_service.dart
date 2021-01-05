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
  DateTime getFoctorsPatientDob() => _doctorsPatientDob;
  void setFoctorsPatientDob(DateTime dob) => _doctorsPatientDob = dob;

  static String _doctorsPatientGender;
  String getDoctorsPatientGender() => _doctorsPatientGender;
  void setDoctorsPatientGender(String gender) => _doctorsPatientGender = gender;

  static int _doctorsPatientAge;
  int getDoctorsPatientAge() => _doctorsPatientAge;
  void setDoctorsPatientAge(int age) => _doctorsPatientAge = age;

  static int _doctorsPatientBloodGroup;
  int getDoctorsPatientBloodGroup() => _doctorsPatientBloodGroup;
  void setDoctorsPatientBloodGroup(int blood) =>
      _doctorsPatientBloodGroup = blood;

  static int _doctorsPatientStateName;
  int getDoctorsPatientStateName() => _doctorsPatientStateName;
  void setDoctorsPatientStateName(int state) =>
      _doctorsPatientStateName = state;

  static int _doctorsPatientCityName;
  int getDoctorsPatientCityName() => _doctorsPatientCityName;
  void setDoctorsPatientCityName(int city) => _doctorsPatientCityName = city;

  static int _doctorsPatientPinCode;
  int getDoctorsPatientPinCode() => _doctorsPatientPinCode;
  void setDoctorsPatientPinCode(int pin) => _doctorsPatientPinCode = pin;

  static int _doctorsPatientHomeAddress;
  int getDoctorsPatientHomeAddress() => _doctorsPatientHomeAddress;
  void setDoctorsPatientHomeAddress(int address) =>
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
