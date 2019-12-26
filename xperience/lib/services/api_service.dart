import '../model/manage_user_model.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = "http://192.168.1.107:8091/api";

  Client client = Client();

  Future<String> postUser(ManageUserModel data) async {
    try {
      var url = "$baseUrl/Users";
      print(url);

       var json = toJson(data);
       print(json);
       
      final response = await client.post(
        url,
        headers: {"content-type": "application/json"},
        body: json,
      );
      print(response);
      if (response.statusCode == 201) {
        return "User Created";
      } else {
        return "User Creation Failed";
      }
    } catch (error) {
      print(error);
      return "User Creation Failed";
    }
  }
}
