// To parse this JSON data, do
//
//     final diagnosticCustomer = diagnosticCustomerFromJson(jsonString);

import 'dart:convert';

DiagnosticCustomer diagnosticCustomerFromJson(String str) =>
    DiagnosticCustomer.fromJson(json.decode(str));

String diagnosticCustomerToJson(DiagnosticCustomer data) =>
    json.encode(data.toJson());

class DiagnosticCustomer {
  DiagnosticCustomer({
    this.name,
    this.phoneNumber,
    this.email,
    this.gender,
    this.dob,
    this.address,
    this.customerImage,
    this.role,
    this.bloodGroup,
  });

  String name;
  int phoneNumber;
  String email;
  String gender;
  DateTime dob;
  Address address;
  String customerImage;
  int role;
  String bloodGroup;

  factory DiagnosticCustomer.fromJson(Map<String, dynamic> json) =>
      DiagnosticCustomer(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        address: Address.fromJson(json["address"]),
        customerImage: json["customerImage"],
        role: json["role"],
        bloodGroup: json["bloodGroup"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "gender": gender,
        "dob": dob.toIso8601String(),
        "address": address.toJson(),
        "customerImage": customerImage,
        "role": role,
        "bloodGroup": bloodGroup,
      };
}

class Address {
  Address({
    this.state,
    this.city,
    this.pincode,
    this.homeAddress,
  });

  String state;
  String city;
  int pincode;
  String homeAddress;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        homeAddress: json["homeAddress"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "pincode": pincode,
        "homeAddress": homeAddress,
      };
}
