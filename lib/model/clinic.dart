// To parse this JSON data, do
//
//     final clinic = clinicFromJson(jsonString);

import 'dart:convert';

Clinic clinicFromJson(String str) => Clinic.fromJson(json.decode(str));

String clinicToJson(Clinic data) => json.encode(data.toJson());

class Clinic {
  Clinic({
    this.address,
    this.location,
    this.name,
    this.phoneNumber,
    this.role,
    this.logo,
    this.addressProof,
    this.ownerName,
    this.ownerPhoneNumber,
    this.ownerIdProofName,
    this.ownerIdProof,
    this.services,
    this.clinicEmployee,
    this.id,
    this.customers,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ClinicAddress address;
  Location location;
  String name;
  int phoneNumber;
  dynamic role;
  String logo;
  String addressProof;
  String ownerName;
  int ownerPhoneNumber;
  String ownerIdProofName;
  String ownerIdProof;
  List<String> services;
  List<dynamic> clinicEmployee;
  String id;
  List<CustomerElement> customers;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        address: ClinicAddress.fromJson(json["address"]) ?? '',
        location: Location.fromJson(json["location"]) ?? '',
        name: json["name"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        role: json["role"] ?? '',
        logo: json["logo"] ?? '',
        addressProof: json["addressProof"] ?? '',
        ownerName: json["ownerName"] ?? '',
        ownerPhoneNumber: json["ownerPhoneNumber"] ?? '',
        ownerIdProofName: json["ownerIdProofName"] ?? '',
        ownerIdProof: json["ownerIdProof"] ?? '',
        services: List<String>.from(json["services"].map((x) => x)) ?? '',
        clinicEmployee:
            List<dynamic>.from(json["clinicEmployee"].map((x) => x)) ?? '',
        id: json["_id"] ?? '',
        customers: List<CustomerElement>.from(
                json["customers"].map((x) => CustomerElement.fromJson(x))) ??
            '',
        createdAt: DateTime.parse(json["createdAt"]) ?? '',
        updatedAt: DateTime.parse(json["updatedAt"]) ?? '',
        v: json["__v"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "location": location.toJson(),
        "name": name,
        "phoneNumber": phoneNumber,
        "role": role,
        "logo": logo,
        "addressProof": addressProof,
        "ownerName": ownerName,
        "ownerPhoneNumber": ownerPhoneNumber,
        "ownerIdProofName": ownerIdProofName,
        "ownerIdProof": ownerIdProof,
        "services": List<dynamic>.from(services.map((x) => x)),
        "clinicEmployee": List<dynamic>.from(clinicEmployee.map((x) => x)),
        "_id": id,
        "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class ClinicAddress {
  ClinicAddress({
    this.state,
    this.city,
    this.pincode,
    this.clinicAddress,
  });

  String state;
  String city;
  int pincode;
  String clinicAddress;

  factory ClinicAddress.fromJson(Map<String, dynamic> json) => ClinicAddress(
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        clinicAddress: json["clinicAddress"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "pincode": pincode,
        "clinicAddress": clinicAddress,
      };
}

class CustomerElement {
  CustomerElement({
    this.appointmentDate,
    this.id,
    this.customer,
  });

  List<DateTime> appointmentDate;
  String id;
  CustomerCustomer customer;

  factory CustomerElement.fromJson(Map<String, dynamic> json) =>
      CustomerElement(
        appointmentDate: List<DateTime>.from(
            json["appointmentDate"].map((x) => DateTime.parse(x))),
        id: json["_id"],
        customer: CustomerCustomer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "appointmentDate":
            List<dynamic>.from(appointmentDate.map((x) => x.toIso8601String())),
        "_id": id,
        "customer": customer.toJson(),
      };
  Map<String, dynamic> toJsonForApi() => {
        "appointmentDate":
            List<dynamic>.from(appointmentDate.map((x) => x.toIso8601String())),
        "customer": customer.toJson(),
      };
}

class CustomerElementForPUT {
  CustomerElementForPUT({
    this.appointmentDate,
    this.customer,
  });

  List<DateTime> appointmentDate;
  CustomerCustomer customer;

  factory CustomerElementForPUT.fromJson(Map<String, dynamic> json) =>
      CustomerElementForPUT(
        appointmentDate: List<DateTime>.from(
            json["appointmentDate"].map((x) => DateTime.parse(x))),
        customer: CustomerCustomer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "appointmentDate":
            List<dynamic>.from(appointmentDate.map((x) => x.toIso8601String())),
        "customer": customer.toJson(),
      };
}

class CustomerCustomer {
  CustomerCustomer({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.gender,
    this.dob,
    this.address,
    this.bloodGroup,
  });

  String id;
  String name;
  int phoneNumber;
  String email;
  String gender;
  DateTime dob;
  CustomerAddress address;
  String bloodGroup;

  factory CustomerCustomer.fromJson(Map<String, dynamic> json) =>
      CustomerCustomer(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        email: json["email"] ?? '',
        gender: json["gender"] ?? '',
        dob: DateTime.parse(json["dob"]) ?? '',
        address: CustomerAddress.fromJson(json["address"]) ?? '',
        bloodGroup: json["bloodGroup"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "gender": gender,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "address": address.toJson(),
        "bloodGroup": bloodGroup,
      };
}

class CustomerAddress {
  CustomerAddress({
    this.state,
    this.city,
    this.pinCode,
    this.homeAddress,
  });

  String state;
  String city;
  int pinCode;
  String homeAddress;

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      CustomerAddress(
        state: json["state"] ?? '',
        city: json["city"] ?? '',
        pinCode: json["pinCode"] ?? '',
        homeAddress: json["homeAddress"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "pinCode": pinCode,
        "homeAddress": homeAddress,
      };
}

class Location {
  Location({
    this.longitude,
    this.latitude,
  });

  double longitude;
  double latitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
      };
}
