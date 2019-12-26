import 'dart:convert';

import 'package:intl/intl.dart';

class ManageUserModel {
  int id;
  String name;
  String biography;
  bool connectorStatus;
  DateTime dateOfBirth;
  String gender;
  String info;
  String password;
  int locationId;
  int religionId;
  String userName;
  String email;

  ManageUserModel(
      {this.id = 0,
      this.userName,
      this.email,
      this.password,
      this.name,
      this.biography = "",

      this.gender,
      this.dateOfBirth,
      this.connectorStatus = false,
      this.info = "",
      this.locationId = 0,
      this.religionId = 0});

//Flutter way of creating a constructor
  factory ManageUserModel.fromJson(Map<String, dynamic> json) =>
      ManageUserModel(
        id: json['id'],
        userName: json['userName'],
        email: json['email'],
        password: json['password'],
        name: json['name'],
        biography: json['biography'],

        connectorStatus: json['connectorStatus'],
        dateOfBirth: json['dateOfBirth'],
        gender: json['gender'],
        info: json['info'],
        locationId: json['locationId'],
        religionId: json['religionId'],
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "password": password,
      "name": name,
      "biography": biography,

      "connectorStatus": connectorStatus,
      "dateOfBirth": DateFormat('yyyy-MM-dd').format(dateOfBirth),
      "gender": gender,
      "info": info,
      "locationId": locationId,
      "religionId": religionId,
    };
  }
}

List<ManageUserModel> fromJson(String jsonData) {
  // Decode json to extract a map
  final data = json.decode(jsonData);
  return List<ManageUserModel>.from(
      data.map((item) => ManageUserModel.fromJson(item)));
}

String toJson(ManageUserModel data) {
  // First we convert the object to a map
  final jsonData = data.toMap();
  // Then we encode the map as a JSON string
  return json.encode(jsonData);
}
