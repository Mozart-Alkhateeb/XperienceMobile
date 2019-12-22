import 'dart:convert';

class ManageUserModel {

  String id;
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

  ManageUserModel({this.id,this.userName,this.email,this.gender,this.dateOfBirth,this.password,this.name,this.biography,this.connectorStatus,this.info,this.locationId,this.religionId});

//Flutter way of creating a constructor
  factory ManageUserModel.fromJson(Map<String, dynamic> json) => ManageUserModel(

      id: json['Id'],
      userName: json['UserName'],
      email: json['Email'],
      gender: json['Gender'],
      dateOfBirth: json['DateOfBirth'],
      password: json['Password'],
      name: json['Name'],
      biography: json['Biography'],
      connectorStatus: json['ConnectorStatus'],
      info: json['Info'],
      locationId: json['LocationId'],
      religionId: json['ReligionId'],



  );

  Map<String, dynamic> toMap() {
    return {"Id": id, "UserName": userName, "Name": name,"Biography":biography,"ConnectorStatus":connectorStatus,
      "DateOfBirth":dateOfBirth,"Gender":gender,"Info":info,"LocationId":locationId,"ReligionId":religionId,"Email":email,"Password":password};
  }
}
List<ManageUserModel> fromJson(String jsonData) {
  // Decode json to extract a map
  final data = json.decode(jsonData);
  return List<ManageUserModel>.from(data.map((item) => ManageUserModel.fromJson(item)));
}

String toJson(ManageUserModel data) {
  // First we convert the object to a map
  final jsonData = data.toMap();
  // Then we encode the map as a JSON string
  return json.encode(jsonData);

}