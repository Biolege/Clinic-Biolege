// To parse this JSON data, do
//
//     final clinic = clinicFromJson(jsonString);

import 'dart:convert';

import 'package:clinicapp/misc/localKeys/localStorageKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Address address;
  Location location;
  String name;
  int phoneNumber;
  int locationType;
  int role;
  String logo;
  String addressProof;
  String ownerName;
  int ownerPhoneNumber;
  String ownerIdProofName;
  String ownerIdProof;
  List<String> services;
  List<ClinicEmployeeInClinic> clinicEmployee;
  String id;
  List<CustomerElement> customers;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Future initClinicData() async {
    try {
      SharedPreferences _localStorage = await SharedPreferences.getInstance();
      id = _localStorage.getString(clinicIdLocalStorageKey);
      name = _localStorage.getString(clinicNameLocalStorageKey);
      phoneNumber = _localStorage.getInt(clinicPhoneNumberLocalStorageKey);
      locationType = _localStorage.getInt(clinicLocationTypeLocalStorageKey);
      logo = _localStorage.getString(clinicLogoLocalStorageKey);
      location = Location(
          latitude:
              _localStorage.getDouble(clinicLocationLatitudeLocalStorageKey),
          longitude:
              _localStorage.getDouble(clinicLocationLongitudeLocalStorageKey));
      address = Address(
          city: _localStorage.getString(clinicCityNameLocalStorageKey),
          clinicAddress: _localStorage.getString(clinicAddressLocalStorageKey),
          pincode:
              int.parse(_localStorage.getString(clinicPinCodeLocalStorageKey)),
          state: _localStorage.getString(clinicStateNameLocalStorageKey));
      addressProof = _localStorage.getString(clinicAddressProofLocalStorageKey);
      ownerName = _localStorage.getString(clinicOwnerNameLocalStorageKey);
      ownerPhoneNumber = _localStorage.getInt(clinicOwnerPhoneLocalStorageKey);
      ownerIdProofName =
          _localStorage.getInt(clinicOwnerIdProofTypeLocalStorageKey) == 0
              ? "PAN Card"
              : _localStorage.getInt(clinicOwnerIdProofTypeLocalStorageKey) == 1
                  ? "Aadhar Card"
                  : "Voter Card";
      ownerIdProof = _localStorage.getString(clinicOwnerIdProofLocalStorageKey);
      services = _localStorage.getStringList(clinicServicesLocalStorageKey);
    } catch (e) {
      print("No data stored to serve for Clinic Data Service.");
      print("Error thrown in Init Clinic : " + e.toString());
    }
  }

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        address: Address.fromJson(json["address"]),
        location: Location.fromJson(json["location"]),
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
        logo: json["logo"],
        addressProof: json["addressProof"],
        ownerName: json["ownerName"],
        ownerPhoneNumber: json["ownerPhoneNumber"],
        ownerIdProofName: json["ownerIdProofName"],
        ownerIdProof: json["ownerIdProof"],
        services: List<String>.from(json["services"].map((x) => x)),
        clinicEmployee: List<ClinicEmployeeInClinic>.from(json["clinicEmployee"]
            .map((x) => ClinicEmployeeInClinic.fromJson(x))),
        id: json["_id"],
        customers: List<CustomerElement>.from(
            json["customers"].map((x) => CustomerElement.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
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
        "clinicEmployee":
            List<dynamic>.from(clinicEmployee.map((x) => x.toJson())),
        "_id": id,
        "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
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
    this.clinicAddress,
    this.pinCode,
    this.homeAddress,
  });

  String state;
  String city;
  dynamic pincode;
  String clinicAddress;
  int pinCode;
  String homeAddress;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        clinicAddress:
            json["clinicAddress"] == null ? null : json["clinicAddress"],
        pinCode: json["pinCode"] == null ? null : json["pinCode"],
        homeAddress: json["homeAddress"] == null ? null : json["homeAddress"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "pincode": pincode,
        "clinicAddress": clinicAddress == null ? null : clinicAddress,
        "pinCode": pinCode == null ? null : pinCode,
        "homeAddress": homeAddress == null ? null : homeAddress,
      };
}

class ClinicEmployeeInClinic {
  ClinicEmployeeInClinic({
    this.name,
    this.phoneNumber,
    this.email,
    this.gender,
    this.dob,
    this.address,
    this.role,
  });

  String name;
  int phoneNumber;
  String email;
  String gender;
  DateTime dob;
  Address address;
  int role;

  factory ClinicEmployeeInClinic.fromJson(Map<String, dynamic> json) =>
      ClinicEmployeeInClinic(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        address: Address.fromJson(json["address"]),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "gender": gender,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "address": address.toJson(),
        "role": role,
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
}

class CustomerCustomer {
  CustomerCustomer({
    this.name,
    this.phoneNumber,
    this.email,
    this.gender,
    this.dob,
    this.address,
    this.bloodGroup,
  });

  String name;
  int phoneNumber;
  String email;
  String gender;
  DateTime dob;
  Address address;
  String bloodGroup;

  factory CustomerCustomer.fromJson(Map<String, dynamic> json) =>
      CustomerCustomer(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        address: Address.fromJson(json["address"]),
        bloodGroup: json["bloodGroup"],
      );

  Map<String, dynamic> toJson() => {
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
