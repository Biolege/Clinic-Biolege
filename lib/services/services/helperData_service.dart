// Helper class used while creating a new doctor's patient
import 'dart:convert';

import 'package:clinicapp/model/clinic.dart';

import '../../model/doctor.dart';

class PatientDetails {
  // __________________________________________________________________________
  // Variables
  static String _doctorsPatientPhoneNumber;
  String getDoctorsPatientPhoneNumber() => _doctorsPatientPhoneNumber;
  void setDoctorsPatientPhoneNumber(String phone) =>
      _doctorsPatientPhoneNumber = phone;
  // ----------------------------------------------------------------
  static String _doctorsPatientName;
  String getDoctorsPatientName() => _doctorsPatientName;
  void setDoctorsPatientName(String name) => _doctorsPatientName = name;
  // ----------------------------------------------------------------
  static DateTime _doctorsPatientDob;
  DateTime getDoctorsPatientDob() => _doctorsPatientDob;
  void setDoctorsPatientDob(DateTime dob) => _doctorsPatientDob = dob;
  // ----------------------------------------------------------------
  static String _doctorsPatientGender;
  String getDoctorsPatientGender() => _doctorsPatientGender;
  void setDoctorsPatientGender(String gender) => _doctorsPatientGender = gender;
  // ----------------------------------------------------------------
  static int _doctorsPatientAge;
  int getDoctorsPatientAge() => _doctorsPatientAge;
  void setDoctorsPatientAge(int age) => _doctorsPatientAge = age;
  // ----------------------------------------------------------------  void setDoctorsPatientAge(int age) => _doctorsPatientAge = age;

  static String _doctorsPatientBloodGroup;
  String getDoctorsPatientBloodGroup() => _doctorsPatientBloodGroup;
  void setDoctorsPatientBloodGroup(String blood) =>
      _doctorsPatientBloodGroup = blood;
  // ----------------------------------------------------------------
  static String _doctorsPatientStateName;
  String getDoctorsPatientStateName() => _doctorsPatientStateName;
  void setDoctorsPatientStateName(String state) =>
      _doctorsPatientStateName = state;
  // ----------------------------------------------------------------
  static String _doctorsPatientCityName;
  String getDoctorsPatientCityName() => _doctorsPatientCityName;
  void setDoctorsPatientCityName(String city) => _doctorsPatientCityName = city;
  // ----------------------------------------------------------------
  static String _doctorsPatientPinCode;
  String getDoctorsPatientPinCode() => _doctorsPatientPinCode;
  void setDoctorsPatientPinCode(String pin) => _doctorsPatientPinCode = pin;
  // ----------------------------------------------------------------
  static String _doctorsPatientHomeAddress;
  String getDoctorsPatientHomeAddress() => _doctorsPatientHomeAddress;
  void setDoctorsPatientHomeAddress(String address) =>
      _doctorsPatientHomeAddress = address;
  // ----------------------------------------------------------------
  static String _doctorsPatientDiagnosticID;
  String getDoctorsPatientDiagnosticID() => _doctorsPatientDiagnosticID;
  void setDoctorsPatientDiagnosticID(String id) =>
      _doctorsPatientDiagnosticID = id;
  // ----------------------------------------------------------------
  static Doctor _doctorsPatientSelectedDoctor;
  Doctor getDoctorsPatientSelectedDoctor() => _doctorsPatientSelectedDoctor;
  void setDoctorsPatientSelectedDoctor(Doctor doc) =>
      _doctorsPatientSelectedDoctor = doc;
  // ----------------------------------------------------------------
  static DateTime _doctorsPatientSelectedDate;
  DateTime getDoctorsPatientSelectedDate() => _doctorsPatientSelectedDate;
  void setDoctorsPatientSelectedDate(DateTime dt) =>
      _doctorsPatientSelectedDate = dt;
  // __________________________________________________________________________
  // Helper Functions
  CustomerCustomer customerDetailsToBeSentIfDoesntExist() {
    return CustomerCustomer.fromJson({
      'id': _doctorsPatientDiagnosticID,
      'name': _doctorsPatientName,
      'phoneNumber': int.parse(_doctorsPatientPhoneNumber),
      // 'customers.customer.email':,
      'gender': _doctorsPatientGender,
      'dob': _doctorsPatientDob.toString(),
      'address': {
        'state': _doctorsPatientStateName,
        'city': _doctorsPatientCityName,
        'pinCode': int.parse(_doctorsPatientPinCode),
        'homeAddress': _doctorsPatientHomeAddress,
      },
      'bloodGroup': _doctorsPatientBloodGroup,
    });
  }

// ----------------------------------------------------------------
  CustomerElement customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist(
      CustomerCustomer cs) {
    return CustomerElement(
        customer: cs,
        appointmentDate: [
          _doctorsPatientSelectedDate,
        ],
        id: _doctorsPatientDiagnosticID);
  }

// ----------------------------------------------------------------
  String latestCustomersListToBeSent(List<CustomerElement> lce) {
    var object = [];
    lce.forEach((customer) => object.add(customer.toJson()));
    return jsonEncode({'customers': object});
  }

// ----------------------------------------------------------------
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
    _doctorsPatientSelectedDoctor = null;
    _doctorsPatientSelectedDate = null;
  }
  // __________________________________________________________________________
}

// Helper class used when creating a new doctor's customers
class DoctorToShowInAppointmentTab {}
