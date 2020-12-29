// To parse this JSON data, do
//
//     final clinic = clinicFromJson(jsonString);

import 'dart:convert';

import '../misc/localKeys/localStorageKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

Clinic clinicFromJson(String str) => Clinic.fromJson(json.decode(str));

String clinicToJson(Clinic data) => json.encode(data.toJson());

class Clinic {
  Clinic({
    this.id,
    this.address,
    this.location,
    this.services,
    this.name,
    this.phoneNumber,
    this.ownerName,
    this.locationType,
    this.ownerIdProofName,
    this.ownerPhoneNumber,
    this.logo,
    this.ownerIdProof,
    this.addressProof,
  });

  String id;
  Address address;
  Location location;
  List<String> services;
  String name;
  int phoneNumber;
  int locationType;
  String ownerName;
  String ownerIdProofName;
  int ownerPhoneNumber;
  String logo;
  String ownerIdProof;
  String addressProof;

  Future initClinicData() async {
    try {
      SharedPreferences _localStorage = await SharedPreferences.getInstance();
      id = _localStorage.getString(clinicIdLocalStorageKey);
      // .......................................................................
      name = _localStorage.getString(clinicNameLocalStorageKey);
      // ------------------------------------------------------------------
      phoneNumber = _localStorage.getInt(clinicPhoneNumberLocalStorageKey);
      // ------------------------------------------------------------------
      locationType = _localStorage.getInt(clinicLocationTypeLocalStorageKey);
      // ------------------------------------------------------------------
      logo = _localStorage.getString(clinicLogoLocalStorageKey);
      // .......................................................................

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
      // .......................................................................
      addressProof = _localStorage.getString(clinicAddressProofLocalStorageKey);
      // .......................................................................
      ownerName = _localStorage.getString(clinicOwnerNameLocalStorageKey);
      // ------------------------------------------------------------------
      ownerPhoneNumber = _localStorage.getInt(clinicOwnerPhoneLocalStorageKey);
      // ------------------------------------------------------------------
      ownerIdProofName =
          _localStorage.getInt(clinicOwnerIdProofTypeLocalStorageKey) == 0
              ? "PAN Card"
              : _localStorage.getInt(clinicOwnerIdProofTypeLocalStorageKey) == 1
                  ? "Aadhar Card"
                  : "Voter Card";
      // ------------------------------------------------------------------
      ownerIdProof = _localStorage.getString(clinicOwnerIdProofLocalStorageKey);

      //........................................................................
      services = _localStorage.getStringList(clinicServicesLocalStorageKey);
      //........................................................................
    } catch (e) {
      print("Error thrown in Init Clinic : " + e);
    }
  }

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        id: json["id"],
        address: Address.fromJson(json["address"]),
        location: Location.fromJson(json["location"]),
        services: List<String>.from(json["services"].map((x) => x)),
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        ownerName: json["ownerName"],
        ownerIdProofName: json["ownerIdProofName"],
        ownerPhoneNumber: json["ownerPhoneNumber"],
        logo: json["logo"],
        ownerIdProof: json["ownerIdProof"],
        addressProof: json["addressProof"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address.toJson(),
        "location": location.toJson(),
        "services": List<dynamic>.from(services.map((x) => x)),
        "name": name,
        "phoneNumber": phoneNumber,
        "ownerName": ownerName,
        "ownerIdProofName": ownerIdProofName,
        "ownerPhoneNumber": ownerPhoneNumber,
        "logo": logo,
        "ownerIdProof": ownerIdProof,
        "addressProof": addressProof,
      };
}

class Address {
  Address({
    this.state,
    this.city,
    this.clinicAddress,
    this.pincode,
  });

  String state;
  String city;
  String clinicAddress;
  int pincode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        state: json["state"],
        city: json["city"],
        clinicAddress: json["clinicAddress"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "clinicAddress": clinicAddress,
        "pincode": pincode,
      };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
  });

  double latitude;
  double longitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
