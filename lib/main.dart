// import 'package:brew_crew/screens/wrapper.dart';
import 'package:duple_firebase_app/models/user.dart';
import 'package:duple_firebase_app/screens/wrapper.dart';
import 'package:duple_firebase_app/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(FirstRun());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }

}
class FirstRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash()); // define it once at root level.
  }
}
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
 Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new MyApp(),
      title: new Text('Welcome To Duple App Demo',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image : new Image.asset(
          'assets/263.gif'),
      backgroundColor: Colors.brown[300],
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.pink[200]
    );
  
  }
}
