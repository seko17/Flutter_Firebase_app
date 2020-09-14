import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duple_firebase_app/services/database.dart';
import 'package:duple_firebase_app/shared/constant.dart';
import 'package:duple_firebase_app/shared/loading.dart';
import 'package:flutter/material.dart';

class Modify extends StatefulWidget {
  @override
  _ModifyState createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
 int list_id;
   String list_name;
   String list_image;
   DatabaseService _db = DatabaseService();
   @override
  void setState(fn) {
    // TODO: implement setState
    var rng = new Random();
  for (var i = 0; i < 10; i++) {
       list_id = rng.nextInt(100);
  }
    super.setState(fn);
  }
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(title: Text('Create Book'),
        backgroundColor: Color.fromRGBO(196, 135, 198, 1),
        ),
              body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Book Name'),
                validator: (val) => val.isEmpty ? 'Enter an Book Name' : null,
                onChanged: (val) {
                  setState(() => list_name = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                // obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Image Url'),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => list_image = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                     Firestore.instance.collection("books").add({
                        "list_id" : list_id,
                        "list_name" : list_name,
                        "list_image" : list_image
                    }).then((result) =>{
                      
                          Navigator.pop(context),
                    });
                
            
                  }
                }
              ),
              SizedBox(height: 12.0),
              // Text(
              //   // error,
              //   style: TextStyle(color: Colors.red, fontSize: 14.0),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}