// import 'dart:convert';

// import 'package:duple_firebase_app/models/Post.dart';
import 'dart:convert';

import 'package:duple_firebase_app/models/Post.dart';
import 'package:duple_firebase_app/models/api_response.dart';
import 'package:duple_firebase_app/models/note_for_listing.dart';
import 'package:duple_firebase_app/services/database.dart';
// import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpService{
   String url = "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=MDyEvhfclnRWHrKB5gIJpg63I6u7KACu";
   final x = <Post>[];
   DatabaseService _db = DatabaseService();
   final int counter = 0;

Future<APIResponse<List<Post>>> getNotesLis() async {
  print('is this called');
   return http.get(url).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final posts = <Post>[];
        for (var item in jsonData["results"]["lists"]) {
          posts.add(Post.fromJson(item));
          _db.getPostApi(Post.fromJson(item));
          // print( _db.posts.toList());
         
          x.add(Post.fromJson(item));
        }
        return APIResponse<List<Post>>(data: posts);
      }
      return APIResponse<List<Post>>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<List<Post>>(error: true, errorMessage: 'An error occured'));
  }
Future<APIResponse<List<Post>>> add(item) async {
  x.add(Post.fromJson(item));
  return APIResponse<List<Post>>(data: x);
}

   List<NoteForListing> getNotesList() {
    return [
      new NoteForListing(
        noteID: "1",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 1"
      ),
      new NoteForListing(
        noteID: "2",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 2"
      ),
      new NoteForListing(
        noteID: "3",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 3"
      ),
    ];
  }
}

// class HttpService {

  
// List<Post> parseProducts(String responseBody) { 
//    final parsed = json.decode(responseBody).<Map<String, dynamic>>(); 
//    return parsed.map<Post>((json) =>Post.fromJson(json)).toList(); 
// } 
// Future<List<Post>> getPosts() async { 
//   // final String response  = 
//   Response response = await get("https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=ss8vpCNpapVSJu9uLOAV8zsE3upqZGbj");
//    if (response.statusCode == 200) { 
//       return parseProducts(response.body); 
//    } else { 
//       throw Exception('Unable to fetch products from the REST API');
//    } 
// }
//    Future<List<Post>> getPosts() async {
//     Response res = await get(postsURL);
//     print('seko');
//       // print(res.body.results);
//         var jsonData = jsonDecode(res.body);
//         print(jsonData['status']);
//     // if (res.statusCode == 200) {
//     //   List<dynamic> body = jsonDecode(res.body);

//     //   List<Post> posts = body.map(
//     //         (dynamic item) => Post.fromJson(item),
//     //       )
//     //       .toList();

//     //   return posts;
//     // } else {
//     //   throw "Can't get posts.";
//     // }
//   }
// }