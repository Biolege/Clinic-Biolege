import 'dart:convert';

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
        pinCode: json["pinCode"],
        homeAddress: json["homeAddress"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "pinCode": pinCode,
        "homeAddress": homeAddress,
      };
}
