import 'dart:convert';
// Import the client from the Http Packages
import 'package:http/http.dart' show Client;
//Import the Todo Model
import 'package:xperience/models/manageUser.dart';

class ApiService {
  // Replace this with your computer's IP Address
  //The port of the iis
  final String baseUrl = "http://10.0.2.2:8070/api";
  Client client = Client();

  Future<String> getUser(String id) async {
    final response = await client.get("$baseUrl/Users/"+id);


    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return json.decode(response.body);//  <------- DO THE PARSING HERE AND THEN PASS THE URL TO THE ABOVE EXAMPLE
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load user');
    }
  }
  getUser22(String username) async {

    final ManageUserModel userID = await getUser2(username);
    return userID;
  }
  Future<ManageUserModel>getUser2(String username) async {
    final response = await client.get("$baseUrl/Users/getUser/"+username);

    if (response.statusCode == 200) {
      print(response.body+" here in getuser2");
      Map valueMap = json.decode(response.body);

      ManageUserModel userModel = ManageUserModel.fromJson(valueMap);

      print(userModel.dateOfBirth);

      // Iterable l = json.decode(response.body);
      // If the call to the server was successful, parse the JSON
      return userModel;//  <------- DO THE PARSING HERE AND THEN PASS THE URL TO THE ABOVE EXAMPLE
    } else {
      print(response.statusCode);
      // If that call was not successful, throw an error.
      throw Exception('Failed to load user2');
    }
  }

// Get All Todos
  /* Future<List<ManageUserModel>> getUsers() async {
    final response = await client.get("$baseUrl/Users");
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      return null;
    }
  }*/
// Update an existing Todo
  /* Future<bool> updateUser(User data) async {
    final response = await client.put(
      "$baseUrl/User/${data.id}",
      headers: {"content-type": "application/json"},
      body: toJson(data),
    );
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }*/

// Create a new Todo
  Future<bool> addUser(ManageUserModel data) async {
    data.biography = "";
    data.email = "tt@gmail.com";
    data.userName = "data";
    data.password = "P!ssw0rd!!@@4444";
    data.gender = "Male";
    final response = await client.post(
      "$baseUrl/Users",
      headers: {"content-type": "application/json"},
      body: toJson(data),
    );

    print(response);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
// Delete a Todo
/* Future<bool> deleteTodo(int todoId) async {
    final response = await client.delete(
      "$baseUrl/Users/$todoId",
    );
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }*/
}