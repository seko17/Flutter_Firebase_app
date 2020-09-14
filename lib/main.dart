// import 'package:brew_crew/screens/wrapper.dart';
import 'package:duple_firebase_app/constants/routes.dart';
import 'package:duple_firebase_app/models/user.dart';
import 'package:duple_firebase_app/routes/routes.dart';
import 'package:duple_firebase_app/screens/wrapper.dart';
import 'package:duple_firebase_app/services/authService.dart';
import 'package:duple_firebase_app/services/httpService.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => HttpService());
}
void main() {
  setupLocator();
   runApp(FirstRun());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        onGenerateRoute : Router.generateRoute ,
        initialRoute: homeView,
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
      seconds: 8,
      navigateAfterSeconds: new MyApp(),
      title: new Text('Book OverView App',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40.0
      ),),
      image : new Image.asset(
          'assets/libraries.png'),
      backgroundColor:  Color.fromRGBO(196, 135, 198, 1),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.white
    );
  
  }
}
