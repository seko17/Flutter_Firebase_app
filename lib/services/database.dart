import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duple_firebase_app/models/Post.dart';
import 'package:duple_firebase_app/models/userModel.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService  {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference _usersCollectionReference = Firestore.instance.collection("users");
    final CollectionReference _apiCollection = Firestore.instance.collection("books");
  // final Firestore _db = Firestore.instance;

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      fullName: snapshot.data['fullName'],
      email: snapshot.data['email'],
     
    );
  }
  // get user doc stream
   Stream<UserData> get userData  {
  
    return _usersCollectionReference.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }
  Future createBook(Post p) async {
     try {
      await _usersCollectionReference.document().setData(p.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getPostApi(Post post) async {
    try{
      await _apiCollection.document().setData(post.toJson());
    } catch (e){
      return e.message;
    }
  }

  Stream<QuerySnapshot> get userDetails {
    return _usersCollectionReference.snapshots();
  }
 
    List<Post> _bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      // print(doc.documentID);
      return Post(
        docid: doc.documentID,
        list_id: doc.data['list_id'] ,
        list_name: doc.data['list_name'] ,
        list_image: doc.data['list_image'],
      );
    }).toList();
  }
   Stream<List<Post>> get posts {
    return _apiCollection.snapshots().map(_bookListFromSnapshot);
  }
  Future totalLikes() async {
  var respectsQuery = Firestore.instance
      .collection('books');
  var querySnapshot = await respectsQuery.getDocuments();
  var totalEquals = querySnapshot.documents.length;
  return totalEquals;
}
}