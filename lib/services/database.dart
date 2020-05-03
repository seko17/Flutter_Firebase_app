import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duple_firebase_app/models/userModel.dart';

class DatabaseService  {
  final CollectionReference _usersCollectionReference = Firestore.instance.collection("users");


  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Stream<QuerySnapshot> get userDetails {
    return _usersCollectionReference.snapshots();
  }
}