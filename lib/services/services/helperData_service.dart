// Helper class used while creating a new doctor's patient
import 'dart:convert';

import 'package:clinicapp/model/clinic.dart';
import 'package:clinicapp/model/diagnosticCustomer.dart';
import 'package:flutter/material.dart';

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
    return CustomerCustomer(id: _doctorsPatientDiagnosticID);
  }

  // ----------------------------------------------------------------
  // Prepare the data for sending to the Clinic and Doctor Object
  CustomerElement customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist(
      CustomerCustomer cs) {
    return CustomerElement(
      id: _doctorsPatientDiagnosticID,
      customer: cs,
      appointmentDate: [
        _doctorsPatientSelectedDate,
      ],
    );
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
    _doctorsPatientDiagnosticID = null;
  }
  // __________________________________________________________________________
}

// Helper class used when creating a new doctor's customers
class DoctorAppointments {
  // __________________________________________________________________________
  // Variables
  static Doctor _selectedDoctor;
  Doctor getSelectedDoctor() => _selectedDoctor;
  void setSelectedDoctor(Doctor doc) {
    print("Selected Doctor for appointments tab : " + doc.name);
    _selectedDoctor = doc;
  }

  static void Function(int index) _controller1, _controller2;
  void Function(int index) getController1() => _controller1;
  void Function(int index) getController2() => _controller2;
  void setController(void Function(int index) x, void Function(int index) y) {
    _controller1 = x;
    _controller2 = y;
  }
}
