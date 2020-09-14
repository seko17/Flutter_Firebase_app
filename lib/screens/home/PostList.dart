import 'package:duple_firebase_app/models/Post.dart';
import 'package:duple_firebase_app/models/api_response.dart';
import 'package:duple_firebase_app/screens/home/BooksTile.dart';
import 'package:duple_firebase_app/services/httpService.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
   HttpService get service => GetIt.I<HttpService>();
  APIResponse<List<Post>> _apiResponse;
  @override
  void initState() {
    // notes = service.getNotesList();
    // note.service.getNotesLis();
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {  
    });
    _apiResponse = await service.getNotesLis();
  }
  int count ;
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<Post>>(context) ?? [];
     return ListView.builder(
      itemCount: count = posts.length,
     
      itemBuilder: (context, index) {
        return BooksTile(post: posts[index], i : count);
      },
    );
  }
}