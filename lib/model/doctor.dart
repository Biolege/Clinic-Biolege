// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

import 'clinic.dart';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  Doctor({
    this.address,
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
    this.name,
    this.experience,
    this.education,
    this.feedbacks,
    this.articles,
    this.clinics,
    this.customers,
    this.v,
  });

  Address address;
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
  String name;
  List<Experience> experience;
  List<Education> education;
  List<Article> feedbacks;
  List<Article> articles;
  List<ClinicElement> clinics;
  List<CustomerElement> customers;
  int v;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        address: Address.fromJson(json["address"]),
        doctorImage: json["doctorImage"],
        dob: DateTime.parse(json["dob"]),
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        email: json["email"],
        specialization: List<String>.from(json["specialization"].map((x) => x)),
        organization: json["organization"],
        about: json["about"],
        services: List<String>.from(json["services"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        experience: List<Experience>.from(
            json["experience"].map((x) => Experience.fromJson(x))),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        feedbacks: List<Article>.from(
            json["feedbacks"].map((x) => Article.fromJson(x))),
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
        clinics: List<ClinicElement>.from(
            json["clinics"].map((x) => ClinicElement.fromJson(x))),
        customers: List<CustomerElement>.from(
            json["customers"].map((x) => CustomerElement.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
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
        "name": name,
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "feedbacks": List<dynamic>.from(feedbacks.map((x) => x.toJson())),
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
        "clinics": List<dynamic>.from(clinics.map((x) => x.toJson())),
        "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
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

class Article {
  Article({
    this.id,
    this.heading,
    this.body,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String heading;
  String body;
  DateTime createdAt;
  DateTime updatedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["_id"],
        heading: json["heading"],
        body: json["body"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "heading": heading,
        "body": body,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class ClinicElement {
  ClinicElement({
    this.id,
    this.clinic,
    this.days,
    this.fees,
    this.avgTime,
    this.avgPatientPerDay,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  ClinicClinic clinic;
  List<Day> days;
  int fees;
  int avgTime;
  int avgPatientPerDay;
  DateTime createdAt;
  DateTime updatedAt;

  factory ClinicElement.fromJson(Map<String, dynamic> json) => ClinicElement(
        id: json["_id"],
        clinic: ClinicClinic.fromJson(json["clinic"]),
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
        fees: json["fees"],
        avgTime: json["avgTime"],
        avgPatientPerDay: json["avgPatientPerDay"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "clinic": clinic.toJson(),
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
        "fees": fees,
        "avgTime": avgTime,
        "avgPatientPerDay": avgPatientPerDay,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class ClinicClinic {
  ClinicClinic({
    this.id,
    this.name,
    this.phoneNumber,
  });

  String id;
  String name;
  String phoneNumber;

  factory ClinicClinic.fromJson(Map<String, dynamic> json) => ClinicClinic(
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phoneNumber": phoneNumber,
      };
}

class Day {
  Day({
    this.id,
    this.day,
    this.startTime,
    this.endTime,
  });

  String id;
  String day;
  int startTime;
  int endTime;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["_id"],
        day: json["day"],
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
      };
}

class Education {
  Education({
    this.id,
    this.educationRegistrationNumber,
    this.educationStartYear,
    this.educationEndYear,
    this.educationDegree,
    this.educationCollege,
    this.educationField,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  int educationRegistrationNumber;
  int educationStartYear;
  int educationEndYear;
  String educationDegree;
  String educationCollege;
  String educationField;
  DateTime createdAt;
  DateTime updatedAt;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["_id"],
        educationRegistrationNumber: json["educationRegistrationNumber"],
        educationStartYear: json["educationStartYear"],
        educationEndYear: json["educationEndYear"],
        educationDegree: json["educationDegree"],
        educationCollege: json["educationCollege"],
        educationField: json["educationField"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "educationRegistrationNumber": educationRegistrationNumber,
        "educationStartYear": educationStartYear,
        "educationEndYear": educationEndYear,
        "educationDegree": educationDegree,
        "educationCollege": educationCollege,
        "educationField": educationField,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Experience {
  Experience({
    this.id,
    this.experienceTitle,
    this.experienceStartYear,
    this.experienceEndYear,
    this.experienceOrganization,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String experienceTitle;
  int experienceStartYear;
  int experienceEndYear;
  String experienceOrganization;
  DateTime createdAt;
  DateTime updatedAt;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json["_id"],
        experienceTitle: json["experienceTitle"],
        experienceStartYear: json["experienceStartYear"],
        experienceEndYear: json["experienceEndYear"],
        experienceOrganization: json["experienceOrganization"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "experienceTitle": experienceTitle,
        "experienceStartYear": experienceStartYear,
        "experienceEndYear": experienceEndYear,
        "experienceOrganization": experienceOrganization,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
