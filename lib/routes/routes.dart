import 'package:duple_firebase_app/constants/routes.dart';
import 'package:duple_firebase_app/screens/home/home.dart';
import 'package:duple_firebase_app/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class Router {
  
static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case homeView:
        return MaterialPageRoute(builder: (_) => Home());
      case profileView:
        return MaterialPageRoute(builder: (_) => Profile());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}