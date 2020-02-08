import 'dart:convert';

class ManageUserModel {

  String id;
  String name;
  String biography;
  String connectorStatus;
  String dateOfBirth;
  String gender;
  String info;
  String password;
  String location;
  String religion;
  String userName;
  String email;
  String profilePicture;
  String profilePictureName;
  String oldPassword;
  String nationalities;
  String languages;


  String phoneNumber;

  ManageUserModel({this.id,this.userName,this.email,this.gender,this.dateOfBirth,this.password,this.name,this.biography,this.connectorStatus,this.info,this.location,this.religion,this.profilePicture,this.phoneNumber,this.profilePictureName,this.nationalities,this.languages,this.oldPassword});

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
      location: json['Location'],
      religion: json['Religion'],
      profilePicture: json['ProfilePicture'],
      phoneNumber: json['PhoneNumber'],
    profilePictureName: json['ProfilePictureName'],
    oldPassword: json['OldPassword'],
    nationalities: json['Nationalities'],
    languages: json['Languages'],



  );

  Map<String, dynamic> toMap() {
    return {"Id": id, "UserName": userName, "Name": name,"Biography":biography,"ConnectorStatus":connectorStatus,
      "DateOfBirth":dateOfBirth,"Gender":gender,"Info":info,"Location":location,"Religion":religion,"Email":email,"Password":password,"ProfilePicture":profilePicture,"PhoneNumber":phoneNumber,"OldPassword":oldPassword,"ProfilePictureName":profilePictureName,"Nationalities":nationalities,"Languages":nationalities};
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