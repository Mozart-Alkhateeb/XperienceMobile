import 'package:flutter/material.dart';
import 'package:instagram_clone/models/global.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import  'package:instagram_clone/models/my_flutter_app_icons.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}
//class EditProfile extends StatefulWidget {
//  @override
//  editProfile createState() => editProfileState();
//}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var devSize=MediaQuery.of(context).size;
    //imageCache.clear();
    return Container(

        child: Column(

          children: <Widget>[


//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    fit: BoxFit.fill,
//                    image: NetworkImage("http://travelhdwallpapers.com/wp-content/uploads/2014/03/Baalbek-4.jpg"),
//                  ),
//                ),

            new AppBar(

              backgroundColor: Colors.black,
              title: new Text('@amena_deeb'),
          //forceElevated: innerBoxIsScrolled
              actions: <Widget>[

                new IconButton( icon: new Icon(Icons.settings,color: Colors.white,), tooltip: 'Air it',iconSize: 30, ),
              ],
                ),
                //margin:   EdgeInsets.only(top: devSize.height*0.2),

//          child: Column(
//            children: <Widget>[
////              Row(
////          children: <Widget>[
////            Container(
////
////            ),
////
////
////          ]
////              ),
//              Row(
//                  children: <Widget>[
//                    Container(
//                      alignment: Alignment.center,
//                      margin:   EdgeInsets.only(left: devSize.width*0.35),
//                      // color: Colors.blue,
//                      height: devSize.height*0.05,
//                      child: Text('@AMENA', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,),  ),
//                    )
//
//                  ]),
//              Row(
//                children: <Widget>[
//                  Container(
//                    height: devSize.height*0.1,
//                    width: devSize.width*0.2,
//                    child: CircleAvatar(backgroundImage: user.profilePicture,),
//                  ),
//                  Column(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(left: 0, right: 10),
//                            child: Column(
//                              children: <Widget>[
//                                Text('129', style: TextStyle(fontWeight: FontWeight.bold),),
//                                Text('posts')
//                              ],
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.only(right: 20),
//                            child: Column(
//                              children: <Widget>[
//                                Text('129K', style: TextStyle(fontWeight: FontWeight.bold),),
//                                Text('followers')
//                              ],
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.only(right: 200),
//                            child: Column(
//                              children: <Widget>[
//                                Text('129', style: TextStyle(fontWeight: FontWeight.bold),),
//                                Text('following')
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                      Row(
//                        children: <Widget>[
//                          Container(
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.all(Radius.circular(5)),
//                              color: Colors.blue,
//                            ),
//                            margin: EdgeInsets.all(10),
//                            width: 120,
//                            height: 30,
//                            child: FlatButton(
//                              child: Text('Contact',style: TextStyle(color: Colors.white),),
//                              onPressed: () {
//
//                              },
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.all(10),
//                            height: 30,
//                            width: 120,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.all(Radius.circular(5)),
//                                border: Border.all(width: 1, color: Color(0xFFE7E7E7))
//                            ),
//                            child: FlatButton(
//                              child: Text('Edit Profile'),
//                              onPressed: () {
//
//                              },
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.all(5),
//                            height: 30,
//                            width: 120,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.all(Radius.circular(5)),
//                                border: Border.all(width: 1, color: Color(0xFFE7E7E7))
//                            ),
//                            child: FlatButton(
//                              child: Text('Edit Profile'),
//                              onPressed: () {
//
//                              },
//                            ),
//                          ),
//                        ],
//                      )
//                    ],
//                  )
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(user.username, style: textStyleBold,),
//                      Text("I am a profile on instagram"),
//                      InkWell(
//                          child: new Text('my instagram'),
//                          onTap: () => launch('https://www.instagram.com/kallehallden/')
//                      ),
//                    ],
//                  ),
//                  Container(
//
//                  )
//                ],
//              )
//            ],)

            Container(
              constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height- 168),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                   // margin: EdgeInsets.all(10),
                    //color:Colors.black,
                    height: devSize.height*0.3,


                    child: Column(
                      children: <Widget>[
//                        Row(
//                    children: <Widget>[
//                      Container(
//                        alignment: Alignment.center,
//                        color: Colors.blue,
//                        width: devSize.width,
//                        //margin:   EdgeInsets.only(left: devSize.width*0.35),
//                         // color: Colors.blue,
//                          height: devSize.height*0.04,
//                          child: Text('@AMENA', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,color:Colors.white),  ),
//                      )
//
//                    ]),
                                      Row(    children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.all(20),
                                      child: Column(

                                        children: <Widget>[

                                          Text('139', style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text('posts')
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
                                            Text('129K', style: TextStyle(fontWeight: FontWeight.bold))]),
                                            Row(
                                                children:<Widget>[
                                                  Text('followers')])
                                          ]
                                      ),
                                              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen()),)
                                          ),
                                         // Text('129K', style: TextStyle(fontWeight: FontWeight.bold),),
                                          //Text('followers')
                                        ],
                                      ),
                                    ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          child: Column(
                                            children: <Widget>[
                                              IconButton(
                                                icon: Image.network('https://uxwing.com/wp-content/themes/uxwing/download/05-objects/diamond.png'),
    onPressed: (){
                               Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen()),);},
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
                                                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen()),)
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
                                                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen()),)
                                              ),
                                              // Text('129K', style: TextStyle(fontWeight: FontWeight.bold),),
                                              //Text('followers')
                                            ],
                                          ),
                                        ),
                                      ]),
                        Row(
                          children: <Widget>[
                            Column(
                                children: <Widget>[
                            Container(

                              height: devSize.height*0.1,
                              width: devSize.width*0.2,
                              margin: EdgeInsets.only(top:0,bottom:0),
                              //child: CircleAvatar(backgroundImage: user.profilePicture,),
                            )]),
                  Expanded(
                            child:Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left:10,bottom:10,top:10),

                                  child:Text('Amena Deeb', style: TextStyle(fontWeight: FontWeight.bold),),
                                )],),

                                   Row(
                                      children: <Widget>[
                                        Expanded(
                                        child:Container(

                                          margin: EdgeInsets.only(left:10,bottom:10),
                                         child: Text('sdjjksjfksdmfksjdknsjndkskkkkkkkgkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjffffffffffffffffffffffffffffffffffff'),
                                         // width: devSize.width*0.1,


                                        ),),],),


                                  ])),


                        ]),
//               Row(
//                 children:<Widget>[
//
//                  new Column(
//                     children:<Widget>[
//
//                       new Container(
//
//                         child:ListView(
//                           //mainAxisSize:MainAxisSize.min,
//
//                            children:<Widget>[
//
//                             RawMaterialButton(
//                              onPressed: (){
//                               Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen()),);},
//                                 child:Text("plzzzz",style: TextStyle(color: Colors.white))) ,
//
//
//
//                            ],)
//                         ,
//                        // child:Text("Beach!",style: TextStyle(color: Colors.white),),
//                         width: 60,
//                         height:50,
//                         margin: EdgeInsets.only(left: 80),
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             fit: BoxFit.fill,
//                             image: NetworkImage("https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&w=1000&q=80"),
//                           ),
//                           //color: Colors.red[400],
//
//                           borderRadius: BorderRadius.all(
//                             const Radius.circular(5),
//                           ),
//                         ),
//
//                       ),
//                     ]
//                   ),
//                   Column(
//                       children:<Widget>[
//
//                         new Container(
//
//                           child:ListView(
//                             //mainAxisSize:MainAxisSize.min,
//
//                             children:<Widget>[
//
//                               RawMaterialButton(
//                                   onPressed: (){
//                                     Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen()),);},
//                                   child:Text("plzzzz",style: TextStyle(color: Colors.white))) ,
//
//
//
//                             ],)
//                           ,
//                           // child:Text("Beach!",style: TextStyle(color: Colors.white),),
//                           width: 60,
//                           height:50,
//                           margin: EdgeInsets.only(left: 10),
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.fill,
//                               image: NetworkImage("https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/topic_centers/2019-8/couple-hiking-mountain-climbing-1296x728-header.jpg?w=1155"),
//                             ),
//                             //color: Colors.red[400],
//
//                             borderRadius: BorderRadius.all(
//                               const Radius.circular(5),
//                             ),
//                           ),
//
//                         ),
//                       ]
//                   ),
//                   Column(
//                       children:<Widget>[
//
//                         new Container(
//
//                           child:ListView(
//                             //mainAxisSize:MainAxisSize.min,
//
//                             children:<Widget>[
//
//                               RawMaterialButton(
//                                   onPressed: (){
//                                     Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen()),);},
//                                   child:Text("plzzzz",style: TextStyle(color: Colors.white))) ,
//
//
//
//                             ],)
//                           ,
//                           // child:Text("Beach!",style: TextStyle(color: Colors.white),),
//                           width: 60,
//                           height:50,
//                           margin: EdgeInsets.only(left: 10),
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.fill,
//                               image: NetworkImage("https://cdn.hiconsumption.com/wp-content/uploads/2019/07/Best-Affordable-Camping-Gear-000-Hero.jpg"),
//                             ),
//                             //color: Colors.red[400],
//
//                             borderRadius: BorderRadius.all(
//                               const Radius.circular(5),
//                             ),
//                           ),
//
//                         ),
//                       ]
//                   ),
//
//
//
//
//
//                   ]),
              Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        color: Colors.amber
                                      ),
                                      margin: EdgeInsets.only(left: 10,top: 10),
width: devSize.width/2.2,
                                      height: 30,
                                      child: FlatButton(
                                        child: Text('Connector Profile',style: TextStyle(color: Colors.white),),
                                        onPressed: () {

                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10,top: 10),
                                      height: 30,
                                      width: devSize.width/2.2,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          border: Border.all(width: 1, color: Color(0xFFE7E7E7))
                                      ),
                                      child: FlatButton(
                                        child: Text('Edit Profile'),
                                        onPressed: ()  {
                                          Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));


                                        },
                                      ),
                                    ),




                                  ]),



//               Row(children: <Widget>[
//                                Column(
//                                 children: <Widget>[
//
//                                Row(
//                                  children: <Widget>[
//                                    Container(
//
//
//                                      margin: EdgeInsets.only(top:10,left: 10, right: 10),
//                                      child: Column(
//                                        children: <Widget>[
//                                          Text('129', style: TextStyle(fontWeight: FontWeight.bold),),
//                                          Text('posts')
//                                        ],
//                                      ),
//                                    ),
//                                    Container(
//                                      margin: EdgeInsets.only(right: 20),
//                                      child: Column(
//                                        children: <Widget>[
//                                          Text('129K', style: TextStyle(fontWeight: FontWeight.bold),),
//                                          Text('followers')
//                                        ],
//                                      ),
//                                    ),
//                                    Container(
//                                      margin: EdgeInsets.only(right: 200),
//                                      child: Column(
//                                        children: <Widget>[
//                                          Text('129', style: TextStyle(fontWeight: FontWeight.bold),),
//                                          Text('following')
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//               ),
//                                Row(
//                                  children: <Widget>[
//                                    Container(
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.all(Radius.circular(5)),
//                                        color: Colors.blue,
//                                      ),
//                                      margin: EdgeInsets.all(10),
//                                      width: 120,
//                                      height: 30,
//                                      child: FlatButton(
//                                        child: Text('Contact',style: TextStyle(color: Colors.white),),
//                                        onPressed: () {
//
//                                        },
//                                      ),
//                                    ),
//                                    Container(
//                                      margin: EdgeInsets.all(10),
//                                      height: 30,
//                                      width: 120,
//                                      decoration: BoxDecoration(
//                                          borderRadius: BorderRadius.all(Radius.circular(5)),
//                                          border: Border.all(width: 1, color: Color(0xFFE7E7E7))
//                                      ),
//                                      child: FlatButton(
//                                        child: Text('Edit Profile'),
//                                        onPressed: () {
//
//                                        },
//                                      ),
//                                    ),
//                                    Container(
//                                      margin: EdgeInsets.all(5),
//                                      height: 30,
//                                      width: 120,
//                                      decoration: BoxDecoration(
//                                          borderRadius: BorderRadius.all(Radius.circular(5)),
//                                          border: Border.all(width: 1, color: Color(0xFFE7E7E7))
//                                      ),
//                                      child: FlatButton(
//                                        child: Text('Edit Profile'),
//                                        onPressed: () {
//
//                                        },
//                                      ),
//                                    ),
//                                  ],
//                                )
//                              ],
//                            )
//                          ],
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Text(user.username, style: textStyleBold,),
//                                Text("I am a profile on instagram"),
//                                InkWell(
//                                    child: new Text('my instagram'),
//                                    onTap: () => launch('https://www.instagram.com/kallehallden/')
//                                ),
//                              ],
//                            ),
//                            Container(
//
//                            )
//                          ],
//                        )
                      ],
                    ),
                    color: Colors.white,
                  ),
                  Container(

                     child:Row(
                         children: <Widget>[
                           new Column(
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


  List<Widget> getPosts() {
    List<Widget> postRows = [];
    List<Widget> posts = [];
    int counter = 0;
//    for (Post post in userPosts) {
//      double marginLeft = 2;
//      if (counter == 3) {
//        marginLeft = 0;
//      } else if (counter == 0) {
//        marginLeft = 0;
//      }
//      posts.add(getPost(post, marginLeft));
//      if (counter == 2) {
//        postRows.add(Container(
//          child: Row(
//            children: posts,
//          ),
//        ));
//        posts = [];
//        counter = 0;
//      } else {
//        counter++;
//      }
//    }
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
        onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen()),)
    );
//    return Container(
//      margin: EdgeInsets.only(left: margin, bottom: 2),
//      height: 125,
//      width: devSize.width*0.329,
//      decoration: BoxDecoration(
//          image: DecorationImage(
//              image: post.image,
//              fit: BoxFit.fill
//          )
//      ),
//    );
  }

}
class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFam = 'MyFlutterApp';

  static const IconData diamond = const IconData(0xe800, fontFamily: _kFontFam);
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Multi Page Application Page - 1"),
        ),
        body: new Checkbox(
            value: false,
            onChanged: (bool newValue) {
              Navigator.pop(ctxt);
              FocusScope.of(ctxt).requestFocus(new FocusNode());// Pop from stack
            }
        )
    );
  }
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppScreenMode();
  }
}

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
  String password='';
  String oldpassword='';
  String confirmpass='';

}

class MyAppScreenMode extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

        theme: new ThemeData(
          //brightness: Brightness.light,
          primaryColor: Colors.black,
          accentColor: Colors.white,

        ),
        home: new Scaffold(
            resizeToAvoidBottomInset: true,
          appBar: new AppBar(
            title: new Text('Edit My Profile'),
          ),
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
        ));
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

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleIcon() {
    setState(() {
      img = !img;
    });
  }

  var _image;

  Future getImageFromCam() async {
    // for camera
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image=image;
    //  user.profilePicture = _image;

    });
  }

  Future getImageFromGallery() async {
    // for gallery
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
     // user.profilePicture=_image;
    });
  }

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  int _radioValue4 = -1;
  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;
    });
  }
  var passKey = GlobalKey<FormFieldState>();
  int value;
  int currStep = 0;
  static MyData data = new MyData();
  @override
  Widget build(BuildContext context) {


    List<Step> steps = [
      new Step(
          title: const Text('Name'),
          //subtitle: const Text('Enter your name'),
          isActive: true,
          //state: StepState.error,
          state: StepState.indexed,
          content: new TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            onSaved: (String value) {
              data.name = value;
            },
            maxLines: 1,
            validator: (value) {
              if (value.isEmpty || value.length < 1) {
                return "Please enter name";
              }

            },
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

            onSaved: (String value) {
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
          content: new TextFormField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (value) {
              if (!value.contains('@')) {
                return 'Please enter valid email';
              }
            },
            onSaved: (String value) {
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
          title: const Text('Age'),
          // subtitle: const Text('Subtitle'),c
          isActive: true,
          state: StepState.indexed,
          content: new TextFormField(
            keyboardType: TextInputType.number,
            autocorrect: false,
            controller: controller,
            onChanged: (String newVal) {
              if(!isNumber(newVal)) {
                controller.clear();
              }
            },
            maxLines: 1,
            onSaved: (String value) {
              data.age = value;
            },
            decoration: new InputDecoration(
                labelText: 'Enter your age',
                hintText: 'Enter age',
                icon: const Icon(Icons.info_outline),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )

      ),

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
              groupValue: _radioValue4,
              onChanged: _handleRadioValueChange4,
            ),
            new Text(
              'Female',
              style:
              new TextStyle(fontSize: 12.0),
            ),
            new Radio(
              value: 1,
              groupValue: _radioValue4,
              onChanged: _handleRadioValueChange4,
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
          content:new TextFormField(
            keyboardType: TextInputType.number,
            autocorrect: false,
            maxLines: 1,
            onSaved: (String value) {
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
          title: const Text('Nationality'),
          // subtitle: const Text('Subtitle'),
          isActive: true,
          state: StepState.indexed,
          content:new TextFormField(
            keyboardType: TextInputType.number,
            autocorrect: false,
            maxLines: 1,
            //autofocus: true,
            textInputAction: TextInputAction.next,
            onSaved: (String value) {
              data.nationalities = value;
            },
            decoration: new InputDecoration(
                labelText: 'Enter your nationalities',
                hintText: 'Enter nationality',
                icon: const Icon(Icons.map),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )

      ),new Step(
          title: const Text('Religion'),
          // subtitle: const Text('Subtitle'),
          isActive: true,

          state: StepState.indexed,
          content:new TextFormField(
            keyboardType: TextInputType.number,
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
          content:new TextFormField(
            keyboardType: TextInputType.number,
            autocorrect: false,
            maxLines: 1,
            //focusNode: _focusNode,
            onSaved: (String value) {
              data.languages = value;
            },
            decoration: new InputDecoration(
                labelText: 'Enter the language(s) you speak',
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
          content:new TextFormField(
            keyboardType: TextInputType.number,
            autocorrect: false,
            maxLines: 1,
            onSaved: (String value) {
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
          title: const Text('Password'),
          // subtitle: const Text('Subtitle'),
          isActive: true,
          state: StepState.indexed,
          content:new Column(
              children:<Widget>[
                //SizedBox(height: _animation.value),
                TextFormField(
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  maxLines: 1,
                  decoration: new InputDecoration(
                      labelText: 'Enter your old password',
                      hintText: 'Enter old pass',
                      icon: const Icon(Icons.security),
                      labelStyle:
                      new TextStyle(decorationStyle: TextDecorationStyle.solid)),
                  obscureText: _obscureText,
                  //autofocus: true,
                  // focusNode: _focusNode,
                ),
                TextFormField(
                  key: passKey,
                  obscureText: _obscureText,
                  //autofocus: true,
                  keyboardType: TextInputType.text,
                  //focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: "new Password",
                    icon: const Icon(Icons.security),
                  ),
                  validator: (password){
                    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regExp = new RegExp(pattern);
                    bool auth=regExp.hasMatch(password);
                    bool auth2=password.length>4;
                    if(!auth){
                      return 'password should have at least one number and at least one character';
                    }
                    if(!auth2) {
                      return 'password should be at least of length 4';
                    }

                  },

                ),
                TextFormField(
                  obscureText: _obscureText,
                  //autofocus: true,
                  keyboardType: TextInputType.text,
                  //focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",

                    icon: const Icon(Icons.security),
                  ),
                  validator: (confirmation){
                    var password = passKey.currentState.value;
                    return equals(confirmation, password) ? null : "Confirm Password should match password";
                  },
                ),
                new FlatButton(
                    onPressed: _toggle,
                    child: new Text(_obscureText ? "Show Password" : "Hide Password"))

              ]))




    ];
    var devSize=MediaQuery.of(context).size;
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(message))
        ,
      );
    }
    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {

        showSnackBarMessage('Please enter correct dataa');
      } else {
        formState.save();
        print("Name: ${data.name}");
        print("Phone: ${data.phone}");
        print("Email: ${data.email}");
        print("Age: ${data.age}");
        print("Gender: ${data.gender}");
        print("Location: ${data.location}");
        print("Biography: ${data.biography}");
        print("Religion: ${data.religion}");
        print("Nationalities: ${data.nationalities}");
        print("Languages: ${data.languages}");
        print("Password: ${data.password}");

        showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text("Details"),
              //content: new Text("Hello World"),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text("Name : " + data.name),
                    new Text("Phone : " + data.phone),
                    new Text("Email : " + data.email),
                    new Text("Age : " + data.age),
                    new Text("Gender : " + data.gender),
                    new Text("Languages: "+data.languages),
                    new Text("Nationalities:"+data.nationalities),
                    new Text("Religion:"+data.religion),
                    new Text("Location:"+data.location),
                    new Text("Biography:"+data.biography),
                    new Text("Password:"+data.password),


                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      }
    }

    return new Scaffold(


        body: Column(children: <Widget>[
         new SingleChildScrollView(
          child: Container(

              child:new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(

                    width: devSize.width/2.0,
                    height: devSize.height/4.1,
                      padding: EdgeInsets.only(top:10.0),
                     // child: _image == null? CircleAvatar(backgroundImage:user.profilePicture):CircleAvatar(backgroundImage:user.profilePicture),

                  ),
                  new Column(
                      children:[
                        FloatingActionButton(
                          heroTag: "btn112",
                        onPressed: getImageFromCam,
                        tooltip: 'Pick Image',
                        child: Icon(Icons.add_a_photo),
                      ),
                        FloatingActionButton(
                          heroTag: "btn2",
                          onPressed: getImageFromGallery,
                          tooltip: 'Pick Image',
                          child: Icon(Icons.wallpaper),
                        ),])
                ],

              ))),

          Expanded(
            child: new Stepper(
              physics: ClampingScrollPhysics(),
              steps: steps,
              type: StepperType.vertical,
              currentStep: this.currStep,
              onStepContinue: () {
                setState(() {
                  if (currStep < steps.length - 1) {
                    currStep = currStep + 1;
                  } else {
                    currStep = 0;
                  }

                });
              },
              onStepCancel: () {
                setState(() {
                  if (currStep > 0) {
                    currStep = currStep - 1;

                  } else {
                    currStep = 0;
                  }
                  //resetSelection();
                });
                // Navigator.of(context).pop();
              },
              onStepTapped: (step) {
                setState(() {
                  currStep = step;

                });
              },
            )
          ),
        ]));


//    return new Container(
//        child: Container(
//        margin: EdgeInsets.all(0),
//
//    child: Form(
//    key: _formKey,
//    child:
//    Row(
//    children:<Widget>[
//    new Stepper(
//    physics: ClampingScrollPhysics(),
//    steps: steps,
//    type: StepperType.vertical,
//    currentStep: this.currStep,
//    onStepContinue: () {
//    setState(() {
//    if (currStep < steps.length - 1) {
//    currStep = currStep + 1;
//    } else {
//    currStep = 0;
//    }
//
//    });
//    },
//    onStepCancel: () {
//    setState(() {
//    if (currStep > 0) {
//    currStep = currStep - 1;
//
//    } else {
//    currStep = 0;
//    }
//    //resetSelection();
//    });
//    // Navigator.of(context).pop();
//    },
//    onStepTapped: (step) {
//    setState(() {
//    currStep = step;
//
//    });
//    },
//    )]
//    )
//    )));








  }
}




bool equals(String pass,String confirm){
  return pass==confirm;
}
bool isNumber(String value) {
  if(value == null) {
    return true;
  }
  final n = num.tryParse(value);
  return n!= null;
}

