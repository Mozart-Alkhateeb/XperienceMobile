import 'package:flutter/material.dart';
import '../widgets/manage_todo_widget.dart';
import '../models/user.dart';
import '../services/api_service.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  ApiService _apiService;
  @override
  void initState() {
    super.initState();
    _apiService = ApiService();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutterrr ToDo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openManageTodoSheet(null, context),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _openManageTodoSheet(null, context),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _apiService.getUsers(), // Get todos which returns a future
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with messagee: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) { // Called when the future is resolved (i.e: when the result is returned from the server)
              List<User> todos = snapshot.data;
              return _buildListView(todos);
            } else {
              return Center(
                child: CircularProgressIndicator(), // Loading with the request is being processed
              );
            }
          },
        ),
      ),
    );
  }
// Build todos list
  Widget _buildListView(List<User> toDos) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemCount: toDos.length,
        itemBuilder: (context, index) {
          User toDo = toDos[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      toDo.userName,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(toDo.email),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            _apiService.deleteTodo(toDo.id).then((_) {
                              setState(() {
                                // Here we call set state in order to rebuild the widget and get todos
                              });
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            _openManageTodoSheet(toDo, context);
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
// This method opens the modal bottom sheet which hosts the ManageTodoWidget which is responsible for editing or adding new Todos
  void _openManageTodoSheet(User toDo, BuildContext context) {
    toDo = toDo ?? new User();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          child: ManageTodoWidget(
            todo: toDo,
            saveChanges: _saveChanges, // We pass a reference tho the _saveChanges so we can call it from the child widget
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
  void _saveChanges(User todo) {
    if (todo.id == 0) { // New Todo with id zero
      _apiService.addUser(todo).then((_) {
        Navigator.of(context).pop(); // Close Modal Bottom sheet
        setState(() {}); // Calling set state to rebuild the UI and get fresh todo list
      });
    } else {
      _apiService.updateUser(todo).then((_) {
        Navigator.of(context).pop(); // Close Modal Bottom sheet
        setState(() {}); // Calling set state to rebuild the UI and get fresh todo list
      });
    }
  }
}