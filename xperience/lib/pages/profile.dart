import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xperience/models/manageUser.dart';
import 'package:xperience/models/post.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:toast/toast.dart';
import 'package:mime/mime.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xperience/models/global.dart';
import 'package:xperience/pages/multi_form.dart';


String path='';
String username='amena';
List<String>followers=new List<String>();
List<String>pictures=new List<String>();

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}
class _ProfilePageState extends State<ProfilePage> {

  Future<ManageUserModel>getUsers(String username) async{
    username='beeso';
    final response = await http.get("http://10.0.2.2:8070/api/Users/getUser/"+username);

    if (response.statusCode == 200) {
      print(response.body + " here in getuser2");
      Map<String, dynamic> map = jsonDecode(response.body);
      ManageUserModel user = ManageUserModel.fromJson(map);
      print(user.dateOfBirth);
      print(user.profilePictureName);
      path=user.profilePictureName;
      print("Successful getUsers method");

      return user;
    }
    else{
      print("Failed getUsers method");
      return null;
    }
  }


  Widget connectorProfile(String status,var devSize){
    if(status=='Enable'){
      return  Row(
          children: <Widget>[

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.amber
              ),
              margin: EdgeInsets.only(left: 10,top:10),
              width: devSize.width/2.2,
              height: 30,
              child: FlatButton(
                child: Text('Connector Profile',style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MultiForm()),);
                },
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 10,top:10),
              height: 30,
              width: devSize.width/2.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(width: 1, color: Color(0xFFE7E7E7))
              ),
              child: RaisedButton(
                  child: Text('Edit Profile'),
                  onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => EditProf()),)

              ),
            ),

          ]);

    }
    else{
      return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child:Container(
                  margin: EdgeInsets.only(left: 10,top:10),
                  height: 30,
                  width: devSize.width/1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(width: 1, color: Color(0xFFE7E7E7))
                  ),
                  child: RaisedButton(
                      child: Text('Edit Profile'),
                      color: Colors.greenAccent,
                      onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => EditProf()),)

                  ),
                ) ),

          ]);
    }
  }
  Widget connections(String status){
    return Container(
      margin: EdgeInsets.all(7),
      child: Column(

        children: <Widget>[
          new InkWell(
              child:
              Column(
                  children:<Widget>[
                    Row(
                        children:<Widget>[
                          Text('123', style: TextStyle(fontWeight: FontWeight.bold))]),
                    Row(
                        children:<Widget>[
                          Text('connections')])
                  ]
              ),
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => FollowingScreen()),)
          ),
          // Text('129K', style: TextStyle(fontWeight: FontWeight.bold),),
          //Text('followers')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var devSize=MediaQuery.of(context).size;

    ErrorWidget.builder = (FlutterErrorDetails details) => Container();
    return FutureBuilder(
      future: getUsers(username),
      builder: (BuildContext context, AsyncSnapshot<ManageUserModel> model) {
        switch (model.connectionState) {
          case ConnectionState.waiting: return new
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/BackToEarth.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Row(
                    mainAxisSize: MainAxisSize.min, //centered things bil nos
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),)]
                ),  /* add child content here */
              ));
          default:
            if (model.hasError)
              return new Text('Error: ${model.error}');
            else
              return Container(

                  child: ListView(

                    children: <Widget>[


                      new AppBar(

                        backgroundColor: Colors.black,

                        title: new Text('@'+model.data.userName),
                        //forceElevated: innerBoxIsScrolled
                        actions: <Widget>[

                          new IconButton( icon: new Icon(Icons.settings,color: Colors.white,), tooltip: 'Air it',iconSize: 30, ),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height- 168),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: <Widget>[
                            Container(
                              height: devSize.height*0.4,


                              child: Column(
                                children: <Widget>[
                                  Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 50,right:20),
                                          child: Column(
                                            children: <Widget>[
                                              Text('139', style: TextStyle(fontWeight: FontWeight.bold),),
                                              Text('posts')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(2),
                                          child: Column(
                                            children: <Widget>[
                                              new InkWell(
                                                  child:
                                                  Column(
                                                      children:<Widget>[
                                                        Row(
                                                            children:<Widget>[
                                                              Text('129K', style: TextStyle(fontWeight: FontWeight.bold))]),
                                                        Row(
                                                            children:<Widget>[
                                                              Text('followers')])
                                                      ]
                                                  ),
                                                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => FollowingScreen()),)
                                              ),
                                              // Text('129K', style: TextStyle(fontWeight: FontWeight.bold),),
                                              //Text('followers')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(2),
                                          child: Column(
                                            children: <Widget>[
                                              IconButton(
                                                icon: Image.network('https://images.vexels.com/media/users/3/151688/isolated/preview/1c7be669e68d05366ad16b7d2b40333b-diamond-gemstone-black-icon-by-vexels.png'),
                                                onPressed: (){
                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => FollowingScreen()),);},
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(7),
                                          child: Column(

                                            children: <Widget>[
                                              new InkWell(
                                                  child:
                                                  Column(
                                                      children:<Widget>[
                                                        Row(
                                                            children:<Widget>[
                                                              Text('500', style: TextStyle(fontWeight: FontWeight.bold))]),
                                                        Row(
                                                            children:<Widget>[
                                                              Text('following')])
                                                      ]
                                                  ),
                                                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => FollowingScreen()),)
                                              ),
                                              // Text('129K', style: TextStyle(fontWeight: FontWeight.bold),),
                                              //Text('followers')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(7),
                                          child: Column(

                                            children: <Widget>[
                                              new InkWell(
                                                  child:
                                                  Column(
                                                      children:<Widget>[
                                                        Row(
                                                            children:<Widget>[
                                                              Text('123', style: TextStyle(fontWeight: FontWeight.bold))]),
                                                        Row(
                                                            children:<Widget>[
                                                              Text('connections')])
                                                      ]
                                                  ),
                                                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => FollowingScreen()),)
                                              ),
                                              // Text('129K', style: TextStyle(fontWeight: FontWeight.bold),),
                                              //Text('followers')
                                            ],
                                          ),
                                        ),
                                      ]),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            CircleAvatar(
                                                radius: 50,
                                                backgroundColor: Colors.transparent,
                                                backgroundImage: NetworkImage("http://10.0.2.2:8070/"+model.data.profilePictureName)
                                            ),

                                            Positioned(
                                              bottom: 0.0,
                                              right: 0.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),

                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(height: 4.0),
                                              Name(model.data.name)
                                              ,]),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(height:4.0),
                                            Biography(model.data.biography)

                                          ],),

                                        connectorProfile(model.data.connectorStatus,devSize),
                                      ]),
                                ],
                              ),
                              color: Colors.white,
                            ),
                            Container(

                                child:Row(
                                    children: <Widget>[
                                      new Row(
                                          children:<Widget>[


                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              width: devSize.width/2.0,
                                              height:50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border: Border(top: BorderSide(color: Colors.black),right:BorderSide(color: Colors.black) ),
                                              ),
                                              child: FlatButton(
                                                child: Text('Xposts',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                onPressed: () {
                                                },
//                            ),Text('Xposts',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                              ),

                                            )]),

                                      new Column(
                                          children:<Widget>[

                                            Container(
                                              padding: EdgeInsets.all(0),
                                              width: devSize.width/2.0,
                                              height:50,
                                              decoration: BoxDecoration(
                                                border: Border(top: BorderSide(color: Colors.black)),
                                              ),

                                              child: IconButton(
                                                icon: Image.network('https://cdn1.iconfinder.com/data/icons/instagram-ui-glyph/48/Sed-13-512.png'),

                                                onPressed: () {},
                                              ),
//                                 child: Tab(
//                                     icon: new Image.network('https://cdn1.iconfinder.com/data/icons/instagram-ui-glyph/48/Sed-13-512.png')
//
//                                 ),
                                            ),

                                          ])


                                    ]

                                  //children<Widget>
                                )
                              // height: 30,
                              //color: Colors.blue,
                            ),
                            Column(
                              children: getPosts(),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              );
        }
      },
//          if(model.hasData){
//            print("hihi");
//          }
    );}
  Widget Biography(String biography){
    if (biography != null) {
      return Center(
          child:Text(
            biography,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ));
    }
  }
  Widget Name(String name) {
    if (name != null) {
      return Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      );
    }
    else{
      return Text(
        'Xtraveler',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      );
    }

  }




  List<Widget> getPosts() {
    List<Widget> postRows = [];
    List<Widget> posts = [];
    int counter = 0;
    for (Post post in userPosts) {
      double marginLeft = 2;
      if (counter == 3) {
        marginLeft = 0;
      } else if (counter == 0) {
        marginLeft = 0;
      }
      posts.add(getPost(post, marginLeft));
      if (counter == 2) {
        postRows.add(Container(
          child: Row(
            children: posts,
          ),
        ));
        posts = [];
        counter = 0;
      } else {
        counter++;
      }
    }
    if (posts.length > 0) {
      postRows.add(Container(
        child: Row(
          children: posts,
        ),
      ));
    }
    return postRows;
  }
  Widget getPost(Post post, double margin) {
    var devSize=MediaQuery.of(context).size;
    return InkWell(
        child:Container(
          margin: EdgeInsets.only(left: margin, bottom: 2),
          height: 125,
          width: devSize.width*0.329,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: post.image,
                  fit: BoxFit.fill
              )
          ),
        ),
        onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => FollowingScreen()),)
    );
  }

}
//class UpdateConnector extends StatefulWidget {
//  UpdateConnector({Key key, this.title}) : super(key: key);
//  final String title;
//
//
//  @override
//  UpdateConnectorState createState() => new UpdateConnectorState();
//
//}

//class UpdateConnectorState extends State<UpdateConnector> {
//  TextEditingController editor=new TextEditingController();
//  @override
//  Widget build(BuildContext context) {
//
//
//    return Scaffold
//      (
//
//      appBar: new AppBar(
//        title: new Text("Connector Profile Info "),
//        flexibleSpace: Image(
//          image: AssetImage('lib/assets/BackToEarth.jpg'),
//          fit: BoxFit.cover,
//        ),
//        backgroundColor: Colors.transparent,
//      ),
//      body:Container(
//
//          child:ListView(
//
//            children: <Widget>[
//              Text('Enter locations'),
//
//              ListView.separated(
//                separatorBuilder: (context, index) => Divider(
//                  color: Colors.black,
//                ),
//                shrinkWrap: true,
//                itemCount: 3,
//                scrollDirection: Axis.horizontal,
//                itemBuilder: (context, index) {
//                  return TextField(
//                    onChanged: (value) {
//
//                    },
//
//                    decoration: InputDecoration(
//                        labelText: "Search",
//                        hintText: "Search",
//                        prefixIcon: Icon(Icons.search),
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.all(Radius.circular(1.0)))),
//                  );
//
//                },
//              ),
//
//            ],
//          )),
//
//    );
//
//
//  }

//}
class FollowingScreen extends StatefulWidget {
  FollowingScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  FollowingScreenState createState() => new FollowingScreenState();

}

class FollowingScreenState extends State<FollowingScreen> {
  TextEditingController editingController = TextEditingController();
  Future<List<ManageUserModel>>load;
  var duplicateItems = List<String>();
  var items = List<String>();
  var pictureItems=List<String>();
  var itemsBackup = List<String>();
  var picturesBackup = List<String>();
  List<bool>pressed = List<bool>();
  List<bool>discard = List<bool>();
  String button = 'follow';

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails details) => Container();
    print("printing items inside Main widget of following list");
    print(items);
    return Scaffold
      (

      appBar: new AppBar(
        title: new Text("Following"),
        flexibleSpace: Image(
          image: AssetImage('lib/assets/BackToEarth.jpg'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  ListTile(
                    title: Text(items[index]),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage:NetworkImage("http://10.0.2.2:8070/${pictureItems[index]}"),//NetworkImage("http://10.0.2.2:8070/"+model.data.profilePictureName)
                    ),
                    trailing: MaterialButton(
                      padding: EdgeInsets.all(8.0),
                      textColor: Colors.white,
// splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      color: pressed[index] ? Colors.blue : Colors.greenAccent,
                      onPressed: () {
                        setState(() {
                          if(!pressed[index])
                          {
                            discard[index]=true;
                            pressed[index] = !pressed[index];

                          }
                          else {
                            pressed[index] = !pressed[index];
                            discard[index] = false;
                          }});},
                      child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: new Text(pressed[index]
                              ? "follow"
                              : "following",
                          )
                      ),

                    ),

                  ));

            },
          ),

        ],
      ),

    );



  }
  @override
  void dispose(){
    super.dispose();
    print("disposing following list");
    _updateFollowedUsers();
  }
  @override
  void initState() {


    load=_getFollowedUsers();
    duplicateItems.addAll(followers);
    items.addAll(duplicateItems);
    print("inside initState of following list");
    print("printing items in initState");
    print(items );
    itemsBackup.addAll(duplicateItems);
    for(int i=0;i<duplicateItems.length;i++){
      pressed.add(false);
      discard.add(false);
    }
    pictureItems.addAll(pictures);
    picturesBackup.addAll(pictures);

    super.initState();

  }


  Future <String> _updateFollowedUsers() async {
    print("reached");
    try {
      print("inside try _updateFollowed");
      String followed = '';


      if(discard.length>0){
        followers = new List<String>();
        pictures = new List<String>();
        for (int i = 0; i < discard.length; i++) {
          if (!discard[i]) {
            followed += duplicateItems[i] + ",";
            followers.add(duplicateItems[i]);
            pictures.add(picturesBackup[i]);
          }
        }

        print("entered updateFollowedUsers method");
        print(followed+" are the users followed by the main user");
        final response = await http.put(
          "http://10.0.2.2:8070/api/Follows/07bb2a17-7cd5-471b-973a-4b77d239b6c3",
          headers: {"content-type": "application/json"},
          body: followed,
        );

        if (response.statusCode != 200) {
          print("Failed to update followed users.");
          print(response.statusCode);
          return null;
        }
        else {
          print("Successful followed users update");
          return response.body;
        }
      } }catch (e) {
      print(e.toString() + "Followed users update catch.");
      return null;
    }
  }

  Future<List<ManageUserModel>>  _getFollowedUsers() async {
    try {
      var response = await http.get(
          "http://10.0.2.2:8070/api/Follows/07bb2a17-7cd5-471b-973a-4b77d239b6c3");

      if (response.statusCode != 200) {
        print(response.statusCode);
        return null;
      }
      else {
        var rb = response.body;
        print("Successful get followed users method.");
        List<ManageUserModel>users2 = new List<ManageUserModel>();
        if (rb != '[]') {
          print("inside if rb condition followed users method");
          var list = json.decode(rb) as List;
          List<ManageUserModel> users = list.map((i) =>
              ManageUserModel.fromJson(i)).toList();
          followers = new List<String>();
          pictures = new List<String>();

          //backup for later use.
          for (final item in users) {
            users2.add(item);
            followers.add(item.userName);
            pictures.add(item.profilePictureName);
          }

          print("The followed users are the following : (getFollowedUsers method)");
          if (followers != null || followers.isNotEmpty)
            for (final i in followers) {
              print(i);
            }

          return users2;
        }
        else {
          print("empty followed users list found.");
          return users2;
        }
      }
    } catch (e) {
      print(e.toString() + "catch of getFollowedUsers");
      return null;
    }
  }


  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      List<String>pics = List<String>();
      for (int i = 0; i < dummySearchList.length; i++) {
        if (dummySearchList[i] == query) {
          dummyListData.add(dummySearchList[i]);
          pics.add(picturesBackup[i]);
        }
      }

      setState(() {
        items.clear();
        items.addAll(dummyListData);
        pictureItems.clear();
        pictureItems.addAll(pics);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
        pictureItems.clear();
        pictureItems.addAll(picturesBackup);
      });
    }
  }



}

class EditProf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
        resizeToAvoidBottomInset: true,
        body:new Container(
          decoration: new BoxDecoration(
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.amber[50],
                  Colors.amber[100],
                  Colors.amber[200],
                  Colors.amber[300],
                ],
              )),
          child:new StepperBody(),
        )
      //resizeToAvoidBottomPadding: false,
    );
  }
}
String confirmpass='';
String password='';
class MyData {
  String name = '';
  String phone = '';
  String email = '';
  String age = '';
  String biography='';
  String gender='';
  String nationalities = '';
  String languages = '';
  String religion='';
  String location='';
  String oldpassword='';
  String enable='';

}

class EditProfBloc extends FormBloc<String, String> {
  final emailField = TextFieldBloc(
    validators: [Validators.email],

  );

  final passwordField = TextFieldBloc(
    asyncValidatorDebounceTime: Duration(milliseconds: 500),
  );
  final confirmPassword = TextFieldBloc(
    asyncValidatorDebounceTime: Duration(milliseconds: 500),

  );
  @override
  List<FieldBloc> get fieldBlocs => [emailField, passwordField,confirmPassword];

  EditProfBloc() {
    passwordField.addAsyncValidators([_isValidPassword]);
    confirmPassword.addAsyncValidators([_confirmPassword]);
  }

  Future<String>_confirmPassword(String confirm)async{

    if (confirm==password) {
      return null;
    }
    else{
      return "Incorrect Password";
    }
  }

  Future<String>_isValidPassword(String password)async{
    String  pattern = '.*[0-9].*';
    RegExp regExp = new RegExp(pattern);

    if (password != null && password.runes.length >= 6 && regExp.hasMatch(password)) {
      return null;
    }
    else{
      return "6 or more characters including at least 1 number.";
    }
  }


  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    // Form logic...
    try {
      print(emailField.value);
      //print(postcodeField.value);
      await Future<void>.delayed(Duration(seconds: 2));
      yield currentState.toSuccess();
    } catch (e) {
      yield currentState.toFailure(
          'Fake error, please continue testing the async validation.');
    }
  }
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => new _StepperBodyState();
}
class _StepperBodyState extends State<StepperBody> with SingleTickerProviderStateMixin {

  DateTime selectedDate = DateTime.now();
  TextEditingController controller = new TextEditingController();
  bool _obscureText = true;
  bool img = false;
  File _imageFile;
  bool _isUploading = false;

  EditProfBloc _simpleFormBloc=new EditProfBloc();


  @override
  void dispose() {
    _simpleFormBloc.dispose();
    super.dispose();
  }


  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  int _radioValue = -1;
  int _radioValue2=-1;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }
  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
    });
  }
  void _getImage(BuildContext context, ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = image;
    });

    // Closes the bottom sheet
    Navigator.pop(context);
  }
  Widget btnWidget = Container();
  Widget _buildUploadBtn() {


    if (_isUploading) {
      // File is being uploaded then show a progress indicator
      btnWidget = Container(
          margin: EdgeInsets.only(top: 10.0),
          child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),)]));
    }
    else {
      // If image is picked by the user then show a upload btn

      btnWidget = Container(

          margin: EdgeInsets.only(top: 10.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ RaisedButton(

              child: Text('Upload'),
              onPressed: () {
                _startUploading();
              },
              color: Colors.lightBlueAccent,
              textColor: Colors.white,

            )],
          ));
    }

    return btnWidget;
  }


  updateProf(File image) async {
    setState(() {
      _isUploading = true;
    });

    var uri = Uri.parse('http://10.0.2.2:8070/api/Users');
    final request = http.MultipartRequest('Put', uri);

    request.fields['id']="07bb2a17-7cd5-471b-973a-4b77d239b6c3";
    request.fields['username']="beeso";
    request.fields['email']=data.email.toString();
    request.fields['password']=password.toString();
    request.fields["oldPassword"]=data.oldpassword.toString();
    request.fields["gender"]=data.gender.toString();
    request.fields["dateOfBirth"]=data.age.toString();
    request.fields["name"]=data.name.toString();
    request.fields["languages"]=data.languages.toString();
    request.fields["nationalities"]=data.nationalities.toString();
    request.fields["phoneNumber"]=data.phone.toString();
    request.fields["biography"]=data.biography.toString();
    request.fields["connectorstatus"]=data.enable.toString();
    request.fields["religion"]=data.religion.toString();
    request.fields["location"]=data.location.toString();


    if(image!=null) {
      final mimeTypeData = lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');
      // Attach the file in the request
      final file = await http.MultipartFile.fromPath(
          'profilePicture', image.path,
          contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

      request.files.add(file);
    }

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        Toast.show("Profile Successfully Updated", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        setState(() => _isUploading = false);
        print("Update profile request successful");
        path=await response.stream.bytesToString();
        print("http://10.0.2.2:8070/"+path);
        return response.statusCode.toString();
      }
      else{
        return null;
      }
    } catch (e) {
      print(e.toString() + "catch update profile request");
      return null;
    }
  }

  void _startUploading() async {

    String response = await updateProf(_imageFile);

    print("Started uploading image.");
    print(response);
    // Check if any error occured
    if (response.contains("400")) {
      setState(() => _isUploading = false);
      Toast.show("Incorrect old password." + "", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

    }
    else if(response.contains("500")){
      setState(() => _isUploading = false);
      Toast.show("Server Error" + "", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

    }
    else {
      print("reached successful update of image");
      setState(() => _isUploading = false);
      Toast.show("Profile Successfully Updated", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }


  }

  void _openImagePickerModal(BuildContext context) {
    final flatButtonColor = Theme.of(context).primaryColor;
    print('Image Picker Modal Called');
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Pick an image',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  textColor: flatButtonColor,
                  child: Text('Use Camera'),
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  },
                ),
                FlatButton(
                  textColor: flatButtonColor,
                  child: Text('Use Gallery'),
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }
  Future<Null> _selectDate(BuildContext context) async {
    if (Platform.isAndroid) {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          data.age = "${picked.month}/${picked.day}/${picked.year}";
        });
    }
    else{
      CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        onDateTimeChanged: (DateTime newdate) {
          data.age = "${newdate.month}/${newdate.day}/${newdate.year}";
        },
        use24hFormat: true,
        maximumDate: DateTime.now(),
        minimumYear: DateTime
            .now()
            .year - 100,
        maximumYear: DateTime
            .now()
            .year,
        minuteInterval: 1,
        mode: CupertinoDatePickerMode.date,

      );
    }
  }

  var passKey = GlobalKey<FormFieldState>();
  int value;
  int currStep = 0;
  static MyData data = new MyData();
  bool isDateSelected= false;
  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      new Step(

        title: const Text('Profile Picture'),
        isActive: true,
        state: StepState.indexed,
        content: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, left: 10.0, right: 10.0),
              child: OutlineButton(
                onPressed: () => _openImagePickerModal(context),
                borderSide:
                BorderSide(color: Theme
                    .of(context)
                    .accentColor, width: 1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.camera_alt),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Add Image'),
                  ],
                ),
              ),
            ),
            _imageFile == null
                ? Text('Please pick an image')
                : Image.file(
              _imageFile,
              fit: BoxFit.cover,
              height: 300.0,
              alignment: Alignment.topCenter,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),

          ],
        ),
      ),
      Step(
          title: const Text('Name'),
          //subtitle: const Text('Enter your name'),
          isActive: true,
          //state: StepState.error,
          state: StepState.indexed,
          content: new TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            onChanged: (String value) {
              data.name = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(

                labelText: 'Enter your name',
                hintText: 'Enter a name',
                //filled: true,
                icon: const Icon(Icons.person),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)
            ),
          )),
      new Step(
          title: const Text('Phone'),
          //subtitle: const Text('Subtitle'),
          isActive: true,
          //state: StepState.editing,
          state: StepState.indexed,
          content: new TextFormField(
            keyboardType: TextInputType.phone,
            autocorrect: false,

            onChanged: (String value) {
              data.phone = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                labelText: 'Enter your number',
                hintText: 'Enter a number',
                icon: const Icon(Icons.phone),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )),

      new Step(
          title: const Text('Email'),
          // subtitle: const Text('Subtitle'),
          isActive: true,
          state: StepState.indexed,
          // state: StepState.disabled,
          content: new TextFieldBlocBuilder(
            keyboardType: TextInputType.emailAddress,
            textFieldBloc: _simpleFormBloc.emailField,
            maxLength: 32,
            autocorrect: false,

            onChanged: (String value) {
              data.email = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                labelText: 'Enter your email',
                hintText: 'Enter a email address',
                icon: const Icon(Icons.email),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )),


      new Step(
          title: const Text('DOB'),
          // subtitle: const Text('Subtitle'),c
          isActive: true,
          state: StepState.indexed,
          content: new Container(
            //  height: MediaQuery.of(context).copyWith().size.height / 5,
            child: RaisedButton(
              // heroTag: "btn1",
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),


          )),

      //GENDER
      new Step(
        title: const Text('Gender'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        content: new Row(
          mainAxisAlignment:
          MainAxisAlignment.start,
          children: <Widget>[
            new Radio(
              value: 0,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text(
              'Female',
              style:
              new TextStyle(fontSize: 12.0),
            ),
            new Radio(
              value: 1,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text(
              'Male',
              style:
              new TextStyle(fontSize: 12.0),
            ),
          ],
        ),

      ),

      new Step(
          title: const Text('Current Location'),
          // subtitle: const Text('Subtitle'),
          isActive: true,
          state: StepState.indexed,
          content: new TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            maxLines: 1,
            onChanged: (String value) {
              data.location = value;
            },
            decoration: new InputDecoration(
                labelText: 'Enter your current location',
                hintText: 'Enter location',
                icon: const Icon(Icons.add_location),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )

      ),
      new Step(
          title: const Text('Nationalities'),
          // subtitle: const Text('Subtitle'),
          isActive: true,
          state: StepState.indexed,
          content: new TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            maxLines: 1,
            //autofocus: true,
            textInputAction: TextInputAction.next,
            onChanged: (String value) {
              data.nationalities = value;
            },
            decoration: new InputDecoration(
                labelText: 'e.g: X,Y,Z..',
                hintText: 'Enter nationalities',
                icon: const Icon(Icons.map),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )

      ), new Step(
          title: const Text('Religion'),
          // subtitle: const Text('Subtitle'),
          isActive: true,

          state: StepState.indexed,
          content: new TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            //autofocus:true,
            maxLines: 1,
            decoration: new InputDecoration(
                labelText: 'Enter your religion',
                hintText: 'Enter religion',
                icon: const Icon(Icons.info),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )

      ),
      new Step(
          title: const Text('Language(s)'),
          // subtitle: const Text('Subtitle'),
          isActive: true,
          state: StepState.indexed,
          content: new TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            maxLines: 1,
            //focusNode: _focusNode,
            onChanged: (String value) {
              data.languages = value;
            },
            decoration: new InputDecoration(
                labelText: 'e.g: X,Y,Z..',
                hintText: 'Enter language(s)',
                icon: const Icon(Icons.language),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )

      ),
      new Step(
          title: const Text('Biography'),
          // subtitle: const Text('Subtitle'),
          isActive: true,
          state: StepState.indexed,
          content: new TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            maxLines: 1,
            onChanged: (String value) {
              data.biography = value;
            },
            decoration: new InputDecoration(
                labelText: 'Enter your biography',
                hintText: 'Enter biography',
                icon: const Icon(Icons.info),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )

      ),
      new Step(
        title: const Text('Connector Status'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        content: new Row(
          mainAxisAlignment:
          MainAxisAlignment.start,
          children: <Widget>[
            new Radio(
              value: 0,
              groupValue: _radioValue2,
              onChanged: _handleRadioValueChange2,
            ),
            new Text(
              'Enable',
              style:
              new TextStyle(fontSize: 12.0),
            ),
            new Radio(
              value: 1,
              groupValue: _radioValue2,
              onChanged: _handleRadioValueChange2,
            ),
            new Text(
              'Disable',
              style:
              new TextStyle(fontSize: 12.0),
            ),
          ],
        ),

      ),

      new Step(
          title: const Text('Password'),
          // subtitle: const Text('Subtitle'),
          //isActive: true,
          state: StepState.indexed,
          isActive: true,
          content: new Column(
              children: <Widget>[

                //SizedBox(height: _animation.value),
                new TextField(
                  keyboardType: TextInputType.text,
                  //autocorrect: false,
                  maxLines: 1,
                  onChanged: (String value) {
                    data.oldpassword = value;
                  },

                  decoration: new InputDecoration(
                      labelText: 'Enter your old password',
                      hintText: 'Enter old pass',

                      icon: const Icon(Icons.security),
                      labelStyle:
                      new TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                  obscureText: _obscureText,
                  //autofocus: true,
                  // focusNode: _focusNode,
                ),
                new TextFieldBlocBuilder(
                  keyboardType: TextInputType.text,
                  //autocorrect: false,
                  textFieldBloc: _simpleFormBloc.passwordField,
                  maxLines: 1,
                  //validator: passwordValidator,
                  obscureText: _obscureText,
                  suffixButton: SuffixButton.obscureText,
                  onChanged: (String value) {
                    password = value;
                  },
                  //focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: "new Password",
                    hintText: 'Enter new pass',
                    icon: const Icon(Icons.security),
                  ),
                ),
                new TextFieldBlocBuilder(
                  obscureText: _obscureText,
                  //autofocus: true,
                  keyboardType: TextInputType.text,
                  textFieldBloc: _simpleFormBloc.confirmPassword,
                  suffixButton: SuffixButton.obscureText,
                  onChanged: (String value) {
                    confirmpass = value;
                  },
                  // validator: (val) => MatchValidator(errorText: 'passwords do not match').validateMatch(val, data.password),
                  //focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",

                    icon: const Icon(Icons.security),
                  ),

                ),
                new FlatButton(
                    onPressed: _toggle,
                    child: new Text(
                        _obscureText ? "Show Password" : "Hide Password")),


              ])),
    ];


    return  new Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text("Edit Your Profile",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.user,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body:FormBlocListener(
          formBloc: _simpleFormBloc,
          key: _formKey,
          onSubmitting: (context, state) {
            // Show the progress dialog
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => WillPopScope(
                onWillPop: () async => false,
                child: Center(
                  child: Card(
                    child: Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(12.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            );
          },
          child: ListView(
              children: <Widget>[
                new Stepper(
                  physics: ClampingScrollPhysics(),
                  steps: steps,
                  type: StepperType.vertical,
                  currentStep: this.currStep,
                  onStepTapped: (step) {
                    setState(() {
                      currStep = step;

                    });
                  },

                  controlsBuilder: (BuildContext context,
                      {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
                      Container(),
                ),
              ])
      ),persistentFooterButtons: <Widget>[
      _buildUploadBtn()
    ],
    );
  }}




