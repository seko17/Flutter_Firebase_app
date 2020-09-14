class UserModel {
  final String id;
  final String fullName;
  final String email;


  UserModel({this.id, this.fullName, this.email});
  
  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      
    };
  }

 
}

 class UserData { 
  final String uid;
  final String fullName;
  final String email;


  UserData({this.uid, this.fullName, this.email});
  }