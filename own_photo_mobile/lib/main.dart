import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:own_photo_mobile/practice.dart';
import 'login_signup_page.dart';
//import 'practice.dart';
import 'data.dart';

void main() 
{
   runApp(new MyApp());
}

Data data = new Data();

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //_makePostRequest();
    return new MaterialApp(
      title: 'Flutter Login Demo',
      theme: new ThemeData(
        appBarTheme: AppBarTheme(
     color: Color.fromARGB(255, 185, 219, 142),
  )),
      home: new LoginSignupPage(),
      //home : new Practice(),
    );
  }
}
/*
 _makePostRequest() async {
  // set up POST request arguments
  String url = 'http://192.168.0.10:3000/api/auth/token/obtain/';
  Map<String, String> headers = {"Content-Type": "application/json"};
  String json = '{"username": "admin", "password": "admin"}';
  //  // make POST request
  Response response = await post(url, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  print(statusCode);
  // this API passes back the id of the new item added to the body
  String body = response.body;
}*/