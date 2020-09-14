import 'package:duple_firebase_app/models/Post.dart';
import 'package:duple_firebase_app/screens/home/PostList.dart';
import 'package:duple_firebase_app/screens/home/modifyApi.dart';
import 'package:duple_firebase_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Post>>.value(
      value: DatabaseService().posts,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('List of books'),
          backgroundColor: Color.fromRGBO(196, 135, 198, 1),
          elevation: 0.0,
          actions: <Widget>[
       
            FlatButton.icon(
            icon: Icon(Icons.account_circle, color: Colors.white,),
              label: Text('profile', style: TextStyle(color:Colors.white),),
              onPressed: () async {
                Navigator.pushNamed(context, 'profile');
              },
            )
          ],
        ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(196, 135, 198, 1),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Modify()));
          },
          child: Icon(Icons.add),
        ),
        body: PostList(),
      ),
    );
  }
}