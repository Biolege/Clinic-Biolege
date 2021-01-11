import 'dart:convert';

import '../misc/localKeys/localStorageKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

// To parse this JSON data, use this line
// final clinicEmployee = clinicEmployeeFromJson(jsonString);

ClinicEmployee clinicEmployeeFromJson(String str) =>
    ClinicEmployee.fromJson(json.decode(str));

String clinicEmployeeToJson(ClinicEmployee data) => json.encode(data.toJson());

class ClinicEmployee {
  ClinicEmployee({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.gender,
    this.dob,
    this.address,
    this.role,
    this.employeeImage,
  });

  String id;
  String name;
  int phoneNumber;
  String email;
  String gender;
  String dob;
  Address address;
  int role;
  String employeeImage;

  Future initClinicEmployeeData() async {
    try {
      SharedPreferences _localStorage = await SharedPreferences.getInstance();
      id = _localStorage.getString(uidLocalStorageKey);
      // ------------------------------------------------------------------
      phoneNumber = _localStorage.getInt(phoneNumberLocalStorageKey);
      // .......................................................................
      name = _localStorage.getString(nameLocalStorageKey);
      // .......................................................................
      email = _localStorage.getString(emailAddressLocalStorageKey);
      // .......................................................................
      gender = _localStorage.getString(genderLocalStorageKey);
      // ------------------------------------------------------------------
      dob = _localStorage.getString(dateOfBirthLocalStorageKey);
      // .......................................................................

      address = Address(
          state: _localStorage.getString(stateLocalStorageKey),
          city: _localStorage.getString(cityNameLocalStorageKey),
          homeAddress: _localStorage.getString(addressLocalStorageKey),
          pinCode: _localStorage.getInt(pinCodeLocalStorageKey));
      // .......................................................................
      role = _localStorage.getInt(roleTypeLocalStorageKey);
      // .......................................................................
    } catch (e) {
      print("Error thrown in Init Clinic Employee : " + e);
    }
  }

  factory ClinicEmployee.fromJson(Map<String, dynamic> json) => ClinicEmployee(
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        gender: json["gender"],
        dob: json["dob"],
        address: Address.fromJson(json["address"]),
        role: json["role"],
        employeeImage: json["employeeImage"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "gender": gender,
        "dob": dob,
        "address": address.toJson(),
        "role": role,
        "employeeImage": employeeImage,
      };
}

class Address {
  Address({
    this.state,
    this.city,
    this.pinCode,
    this.homeAddress,
  });

  String state;
  String city;
  int pinCode;
  String homeAddress;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        state: json["state"],
        city: json["city"],
        pinCode: json["pincode"],
        homeAddress: json["homeAddress"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "pincode": pinCode,
        "homeAddress": homeAddress,
      };
}
