// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

DoctorFromList doctorFromJson(String str) =>
    DoctorFromList.fromJson(json.decode(str));

String doctorToJson(DoctorFromList data) => json.encode(data.toJson());

class DoctorFromList {
  DoctorFromList({
    this.address,
    this.name,
    this.doctorImage,
    this.dob,
    this.phoneNumber,
    this.gender,
    this.email,
    this.specialization,
    this.organization,
    this.about,
    this.services,
    this.id,
    this.experience,
    this.education,
    this.feedbacks,
    this.articles,
    this.clinics,
    this.v,
  });

  Address address;
  String name;
  String doctorImage;
  DateTime dob;
  String phoneNumber;
  String gender;
  String email;
  List<String> specialization;
  String organization;
  String about;
  List<String> services;
  String id;
  List<MongoosePopulate> experience;
  List<MongoosePopulate> education;
  List<MongoosePopulate> feedbacks;
  List<MongoosePopulate> articles;
  List<ClinicB> clinics;
  int v;

  factory DoctorFromList.fromJson(Map<String, dynamic> json) => DoctorFromList(
        address: Address.fromJson(json["address"]) ?? '',
        name: json["name"] ?? '',
        doctorImage: json["doctorImage"] ?? '',
        dob: DateTime.parse(json["dob"]) ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        gender: json["gender"] ?? '',
        email: json["email"] ?? '',
        specialization:
            List<String>.from(json["specialization"].map((x) => x)) ?? '',
        organization: json["organization"] ?? '',
        about: json["about"] ?? '',
        services: List<String>.from(json["services"].map((x) => x)) ?? '',
        id: json["_id"] ?? '',
        experience: List<MongoosePopulate>.from(
                json["experience"].map((x) => MongoosePopulate.fromJson(x))) ??
            '',
        education: List<MongoosePopulate>.from(
                json["education"].map((x) => MongoosePopulate.fromJson(x))) ??
            '',
        feedbacks: List<MongoosePopulate>.from(
                json["feedbacks"].map((x) => MongoosePopulate.fromJson(x))) ??
            '',
        articles: List<MongoosePopulate>.from(
                json["articles"].map((x) => MongoosePopulate.fromJson(x))) ??
            '',
        clinics: List<ClinicB>.from(
                json["clinics"].map((x) => ClinicB.fromJson(x))) ??
            '',
        v: json["__v"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "name": name,
        "doctorImage": doctorImage,
        "dob": dob.toIso8601String(),
        "phoneNumber": phoneNumber,
        "gender": gender,
        "email": email,
        "specialization": List<dynamic>.from(specialization.map((x) => x)),
        "organization": organization,
        "about": about,
        "services": List<dynamic>.from(services.map((x) => x)),
        "_id": id,
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "feedbacks": List<dynamic>.from(feedbacks.map((x) => x.toJson())),
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
        "clinics": List<dynamic>.from(clinics.map((x) => x.toJson())),
        "__v": v,
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

class MongoosePopulate {
  MongoosePopulate({
    this.id,
  });

  String id;

  factory MongoosePopulate.fromJson(Map<String, dynamic> json) =>
      MongoosePopulate(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}

class ClinicB {
  ClinicB({
    this.id,
    this.days,
  });

  String id;
  List<dynamic> days;

  factory ClinicB.fromJson(Map<String, dynamic> json) => ClinicB(
        id: json["_id"],
        days: List<dynamic>.from(json["days"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "days": List<dynamic>.from(days.map((x) => x)),
      };
}
