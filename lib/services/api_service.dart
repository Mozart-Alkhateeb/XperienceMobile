import 'dart:convert';
// Import the client from the Http Packages
import 'package:http/http.dart' show Client;
//Import the Todo Model
import 'package:instagram_clone/models/manageUser.dart';

class ApiService {
  // Replace this with your computer's IP Address
  //The port of the iis
  final String baseUrl = "https://192.168.1.4:443/api";
  Client client = Client();
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
    final response = await client.post(
      "$baseUrl/Users",
      headers: {"content-type": "application/json"},
      body: toJson(data),
    );
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