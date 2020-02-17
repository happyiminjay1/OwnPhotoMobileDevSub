import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data.dart';
import 'bottomNavigationBar.dart';
import 'main.dart';
import 'main.dart';

final _formKey = new GlobalKey<FormState>();

class LoginSignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage>{

  @override

//final formKey = new GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'OwnPhoto',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        ),
        body: Stack(
          children: <Widget>[
            showForm(context),
            //showCircularProgress(),
          ],
        ));
  }
}


Widget showForm(BuildContext context) {

  return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key : _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(context),
          ],
        ),
      ));
}

Widget showLogo() {
  return new Hero(
    tag: 'hero',
    child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 150.0,
        child: Image.asset('assets/icon.png'),
      ),
    ),
  );
}

Widget showEmailInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'ID',
          icon: new Icon(
            Icons.perm_identity,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'ID can\'t be empty' : null,
      onSaved: (value) => data.id = value,
    ),
  );
}

Widget showPasswordInput() {

  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: true,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => data.password = value.trim(),
    ),
  );
}


Widget showPrimaryButton(BuildContext context) {
  return new Padding(
      padding: EdgeInsets.fromLTRB(40.0, 45.0, 40.0, 0.0),
      child: SizedBox(
        height: 50.0,
        child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Color.fromARGB(255, 185, 219, 142),
            child: new Text(
              //_isLoginForm ? 'Login' :
                'Sign in',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)
            ),
            onPressed: () {
              //Navigator.push(context, new MaterialPageRoute(builder: (context)=>BottomNavigation()));//))))))))))))))))))))))
              if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _makePostRequest(context);
              }
              //Navigator.push(context, new MaterialPageRoute(builder: (context)=>BottomNavigation()));
            }
        ),
      ));
}

_makePostRequest(BuildContext context) async {
  // set up POST request arguments

  String url = 'http://192.168.86.24:3000/api/auth/token/obtain/';
  Map<String, String> headers = {"Content-Type": "application/json"};
  String json = '{"username": "'+data.id+'", "password": "'+data.password+'"}';
  // make POST request
  http.Response response = await http.post(url, headers: headers, body: json);
  print(json);
  updateCookie(response);
  // check the status code for the result
  int statusCode = response.statusCode;
  print(statusCode);
  print(data.id);
  if(statusCode==200){
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>BottomNavigation()));
  }
  // this API passes back the id of the new item added to the body
}

void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    print('%%%%%%');
    print(rawCookie);
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      String cookieTemp = rawCookie.substring(0, index);
      cookie = cookieTemp;
    }
  }