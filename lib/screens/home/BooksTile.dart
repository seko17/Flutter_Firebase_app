import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duple_firebase_app/models/Post.dart';
import 'package:duple_firebase_app/screens/home/delete.dart';
import 'package:duple_firebase_app/screens/home/modifyApi.dart';
import 'package:flutter/material.dart';

class BooksTile extends StatelessWidget {
  final Post post;
  final int i;
  BooksTile({ this.post, this.i });
  void abc(i){
    print(i);
  }
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 8.0),
      
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child:ListTile(
          leading: CircleAvatar(
            radius: 25.0,
      child:  Image.network(post.list_image)
          ),
          title: Text(post.list_name),
          subtitle: Text("TAP TO DELETE"),
            onTap: () {
                     showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          print(post.docid);
                          return AlertDialog(
                            title: new Text("DELETE"),
                            content:
                                new Text("Are you sure you want to Delete?"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              FlatButton(
                                child: Text('Delete'),
                                onPressed: () async {
                                  // await _auth.signOut();
                                   Firestore.instance.collection("books").document(post.docid).delete().then((r) =>
                                   {
                                       Navigator.of(context).pop()
                                   }) ;
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
        
      ),
      
    );
  }
}