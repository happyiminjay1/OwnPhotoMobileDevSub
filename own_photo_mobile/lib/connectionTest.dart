

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
 
class Post {
  final String id;
  final String password;

  Post({this.id, this.password});
 
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['admin'],
      password: json['admin'],
    );
  }
 
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["password"] = password; 
    return map;
  }
}
 
Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}
 
class MyApp extends StatelessWidget {
  final Future<Post> post;
 
  MyApp({Key key, this.post}) : super(key: key);
  static final CREATE_POST_URL =  'https://jsonplaceholder.typicode.com/posts';
  TextEditingController titleControler = new TextEditingController();
  TextEditingController bodyControler = new TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "WEB SERVICE",
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Create Post'),
          ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Column(
              children: <Widget>[

                new RaisedButton(
                  onPressed: () async {
                    Post newPost = new Post(
                        id: "admin", password: 'admin');
                    Post p = await createPost(CREATE_POST_URL,
                        body: newPost.toMap());
                    print(p.id);
                  },
                  child: const Text("Create"),
                )
              ],
            ),
          )),
    );
  }
}
 
void main() => runApp(MyApp());




