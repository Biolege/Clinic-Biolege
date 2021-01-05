// Helper class used while creating a new doctor's patient
class PatientDetails {
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
}

// Helper class used when creating a new doctor's customers
class DoctorToShowInAppointmentTab {}
