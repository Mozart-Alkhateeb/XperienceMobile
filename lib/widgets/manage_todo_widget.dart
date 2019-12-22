import 'package:flutter/material.dart';
import 'package:instagram_clone/models/manageUser.dart';
import '../services/api_service.dart';

class ManageTodoWidget extends StatefulWidget {
  final ManageUserModel todo;
  final Function saveChanges; // Function passed by the parent widget to save changes
  const ManageTodoWidget({Key key, this.todo, this.saveChanges})
      : super(key: key);
  @override
  _ManageTodoWidgetState createState() => _ManageTodoWidgetState();
}
class _ManageTodoWidgetState extends State<ManageTodoWidget> {
  ApiService _apiService;
// Define the form key that preserve the state of the form
  final _form = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _apiService = ApiService();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                initialValue: widget.todo.userName,
                onSaved: (value) {
                  widget.todo.userName = value; // on saved we persist the form state
                },
              ),
              TextFormField(
                initialValue: widget.todo.email,
                onSaved: (value) {
                  widget.todo.email = value; // on saved we persist the form state
                },
              ),
              TextFormField(
                initialValue: widget.todo.gender,
                onSaved: (value) {
                  widget.todo.gender = value; // on saved we persist the form state
                },
              ),
              TextFormField(
                initialValue: widget.todo.password,
                onSaved: (value) {
                  widget.todo.password = value; // on saved we persist the form state
                },
              ),
              TextFormField(
                initialValue: widget.todo.dateOfBirth.toString(),
                onSaved: (value) {
                  widget.todo.dateOfBirth = DateTime.parse(value); // on saved we persist the form state
                },
              ),
              FlatButton(
                child: Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  _form.currentState.save(); // we call the save method in order to invoke the onsaved method on form fields
                  this.widget.saveChanges(widget.todo); // call the save changes method that was passed by the parent widget
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}