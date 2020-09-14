import 'package:duple_firebase_app/animations/fadeAnimation.dart';
import 'package:duple_firebase_app/models/user.dart';
import 'package:duple_firebase_app/models/userModel.dart';
import 'package:duple_firebase_app/services/authService.dart';
import 'package:duple_firebase_app/services/database.dart';
import 'package:duple_firebase_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _currentName;
  String _email;
  var passVal = [];
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            _currentName = userData.fullName;
            passVal.add(_currentName);
            _email = userData.email;
            print('seko hello' + userData.fullName);
            final width = MediaQuery.of(context).size.width;
    
       
      return  Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(196, 135, 198, 1),
                  title: Text('profile'),
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.settings_power, color: Colors.white,),
                    label: Text('logout', style: TextStyle(color: Colors.white),),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("LOGOUT"),
                            content:
                                new Text("Are you sure you want to logout?"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              FlatButton(
                                child: Text('Yes'),
                                onPressed: () async {
                                  await _auth.signOut();
                                },
                              ),
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: -40,
                          height: 400,
                          width: width,
                          child: FadeAnimation(
                              1,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/background.png'),
                                        fit: BoxFit.fill)),
                              )),
                        ),
                        Positioned(
                          height: 400,
                          width: width + 20,
                          child: FadeAnimation(
                              1.3,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/background-2.png'),
                                        fit: BoxFit.fill)),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),   
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                              1.5,
                              Center(
                              
                              child :Text(
                                "Name:",
                                style: TextStyle(
                                    color: Color.fromRGBO(49, 39, 79, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              )
                              ),
                            ),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              1.7,
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(196, 135, 198, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10),
                                      )
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                                  child: Center( child: Text( _currentName, style: TextStyle( fontSize: 30)),),
                                     
                                    ),
                                 
                                  ],
                                ),
                              )),
                              SizedBox(height : 20),
                                 Center(
                                  
                              child :Text(
                                "Email:",
                                style: TextStyle(
                                    color: Color.fromRGBO(49, 39, 79, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              )
                              ),
                                   SizedBox(height : 20),
                              FadeAnimation(
                              1.7,
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(196, 135, 198, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10),
                                      )
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                                  child: Center( child: Text( _email, style: TextStyle( fontSize: 30)),),
                                     
                                    ),
                                 
                                  ],
                                ),
                              )),
                                    
                        ],
                      ),
               
                  )
                ],
              ),
            ),
          );
   
          } else {
            return Loading();
          }
        });
  }
}
