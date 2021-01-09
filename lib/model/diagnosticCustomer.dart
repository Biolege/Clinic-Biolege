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
    this.address,
    this.role,
    this.id,
    this.name,
    this.phoneNumber,
    this.gender,
    this.dob,
    this.bloodGroup,
    this.doctors,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Address address;
  dynamic role;
  String id;
  String name;
  int phoneNumber;
  String gender;
  DateTime dob;
  String bloodGroup;
  List<DoctorObject> doctors;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory DiagnosticCustomer.fromJson(Map<String, dynamic> json) =>
      DiagnosticCustomer(
        address: Address.fromJson(json["address"]),
        role: json["role"],
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        bloodGroup: json["bloodGroup"],
        doctors: List<DoctorObject>.from(
            json["doctors"].map((x) => DoctorObject.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "role": role,
        "_id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "dob": dob.toIso8601String(),
        "bloodGroup": bloodGroup,
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
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

class DoctorObject {
  DoctorObject({
    this.visitingDate,
    this.id,
    this.doctor,
    this.clinic,
  });

  List<DateTime> visitingDate;
  String id;
  ObjectWithID doctor;
  ObjectWithID clinic;

  factory DoctorObject.fromJson(Map<String, dynamic> json) => DoctorObject(
        visitingDate: List<DateTime>.from(
            json["visitingDate"].map((x) => DateTime.parse(x))),
        id: json["_id"],
        doctor: ObjectWithID.fromJson(json["doctor"]),
        clinic: ObjectWithID.fromJson(json["clinic"]),
      );

  Map<String, dynamic> toJson() => {
        "visitingDate":
            List<dynamic>.from(visitingDate.map((x) => x.toIso8601String())),
        "_id": id,
        "doctor": doctor.toJson(),
        "clinic": clinic.toJson(),
      };
  Map<String, dynamic> toJsonForPut() => {
        "visitingDate":
            List<dynamic>.from(visitingDate.map((x) => x.toIso8601String())),
        "doctor": doctor.toJson(),
        "clinic": clinic.toJson(),
      };
}

class ObjectWithID {
  ObjectWithID({
    this.id,
  });

  String id;

  factory ObjectWithID.fromJson(Map<String, dynamic> json) => ObjectWithID(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
