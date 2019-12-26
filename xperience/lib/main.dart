import 'package:flutter/material.dart';
import 'package:xperience/model/manage_user_model.dart';
import 'package:xperience/services/api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xperience',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService _service = ApiService();
  var _creationStatus = "Nothing Happened Yet!!!";

  void _addUser() {
    setState(() {
      var user = ManageUserModel(
        userName: "my-username",
        email: "my-username@gmail.com",
        password: "P@ssw0rd!!@@##",
        gender: "Male",
        dateOfBirth: DateTime.now(),
        name: "My Name"
      );

      _service.postUser(user).then((res) {
        _creationStatus = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _creationStatus,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        tooltip: 'Add User',
        child: Icon(Icons.add),
      ),
    );
  }
}
