// import 'package:flutter/foundation.dart';

class Post {
  String docid;
   final int list_id;
  final String list_name;
  final String list_image;
  

  Post({
   this.list_id,
  this.list_name,
  this.list_image,
  this.docid
  });


  factory Post.fromJson(Map<String, dynamic> item) {
    return Post(
      list_id: item['list_id'],
      list_name: item['list_name'],
      list_image: item['list_image'],
      
    );
    
  }
   Post.fromData(Map<String, dynamic> data)
      :  list_id = data['list_id'],
        list_name = data['list_name'],
        list_image = data['list_image'];
  Map<String, dynamic> toJson() {
    return {
      'list_id': list_id,
      'list_name': list_name,
      'list_image': list_image,
      
    };
}
}