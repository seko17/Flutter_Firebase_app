import 'package:duple_firebase_app/models/user.dart';
import 'package:duple_firebase_app/screens/authenticate/authenticate.dart';
import 'package:duple_firebase_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // return either the Home or Authenticate widget
   if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}