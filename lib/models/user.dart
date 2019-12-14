import 'dart:convert';
import 'post.dart';
import 'package:flutter/material.dart';

class User {


//public ICollection<Connection> ConnectedTo { get; set; }
//public ICollection<Connection> Connections { get; set; }

//public ICollection<UserReview> UserReviews { get; set; }
//public ICollection<UserReview> ReviewedBy { get; set; }

//public ICollection<Block> Blocks { get; set; }
//public ICollection<Block> BlockedBy { get; set; }

//public ICollection<FollowedUser> FollowedUsers { get; set; }
//public ICollection<FollowedUser> FollowedBy { get; set; }

//public ICollection<ConnectionRequest> SentConnectionRequests { get; set; }
//public ICollection<ConnectionRequest> ReceivedConnectionRequests { get; set; }

//public ICollection<ReportedUser> ReportedUsers { get; set; }
//public ICollection<ReportedUser> ReportedBy { get; set; }

//public ICollection<Rating> Ratings { get; set; }
//public ICollection<Rating> RatedBy { get; set; }

//public ICollection<Tag> Tags { get; set; }
//public ICollection<Tag> TaggedBy { get; set; }
  String username;
  List<Post> posts;
  //AssetImage profilePicture;
  List<User> followers;
  List<User> following;
  List<Post> savedPosts;
  bool hasStory;
  int id;
  String name;
  String biography;
  AssetImage profilePicture;
  bool connectorStatus;
  DateTime dateOfBirth;
  String gender;
  String info;
  int locationId;
  int religionId;
  String userName;
  String email;

//  User(this.username, this.profilePicture, this.followers, this.following,
//      this.posts, this.savedPosts, this.hasStory);
  User({this.id,this.name,this.biography,this.profilePicture,this.connectorStatus,this.dateOfBirth,this.gender,this.info,this.locationId,this.religionId,this.userName,this.email,this.username, this.followers, this.following,this.posts, this.savedPosts, this.hasStory});

// Flutter way of creating a constructor
// factory for mapping JSON to current instance of the Todo class
  factory User.fromJson(Map<String, dynamic> json) => User(
      username: json['username'],
      profilePicture: json['ProfilePicture'],
      followers: json['followers'],
      following: json['following'],
      posts: json['posts'],
      savedPosts: json['savedPosts'],
      hasStory: json['hasStory'],
    userName: json['UserName'],
    id: json['Id'],
    name: json['Name'],
    biography: json['Biography'],
    connectorStatus: json['ConnectorStatus'],
    dateOfBirth: json['DateOfBirth'],
    gender: json['Gender'],
    info: json['Info'],
    locationId: json['LocationId'],
    religionId: json['ReligionId'],
    email: json['Email']


    );

// Instance method for converting a todo item to a map
  Map<String, dynamic> toMap() {
    return {"Id": id, "UserName": userName, "Name": name,"Biography":biography,"ProfilePicture":profilePicture,"ConnectorStatus":connectorStatus,
    "DateOfBirth":dateOfBirth,"Gender":gender,"Info":info,"LocationId":locationId,"ReligionId":religionId,"Email":email};
  }
}
//  A helper method that converts a json array into List<ToDo>
  List<User> fromJson(String jsonData) {
    // Decode json to extract a map
    final data = json.decode(jsonData);
    // Map each todo JSON to a Todo object and return the result as a List<ToDo>
    return List<User>.from(data.map((item) => User.fromJson(item)));
  }

// A helper method to convert the todo object to JSON String
  String toJson(User data) {
    // First we convert the object to a map
    final jsonData = data.toMap();
    // Then we encode the map as a JSON string
    return json.encode(jsonData);

}