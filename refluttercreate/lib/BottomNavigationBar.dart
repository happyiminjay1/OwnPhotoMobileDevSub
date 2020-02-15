import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'login_signup_page.dart';
import 'dart:convert';
import 'dart:io';

class BottomNavigation extends StatefulWidget {


@override
State<StatefulWidget> createState() => new _BottomNavigationBar();
}

class _BottomNavigationBar extends State<BottomNavigation>{

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Date(),
    Search(),
    Me(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    if(_selectedIndex!=2)
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(255, 185, 219, 142),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0,0, 40, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon.png',
                fit: BoxFit.contain,
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child:
                Text(
                    "Photo",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.ltr
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Date'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    else{
      return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            
            tabs: [
              new Tab(icon: new Icon(Icons.place)),
              new Tab(icon: new Icon(Icons.create_new_folder)),
              new Tab(icon: new Icon(Icons.people)),
            ],
          ),
      backgroundColor: Color.fromARGB(255, 185, 219, 142),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0,0, 40, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon.png',
                fit: BoxFit.contain,
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child:
                Text(
                    "Photo",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.ltr
                ),
              )
            ],
          ),
        ),
    ),
    body: new TabBarView(
          children: <Widget>[
            new Container(
              color: Colors.deepOrangeAccent,
              child: new Center(
                child: new Text(
                  "First",
                  style: textStyle(),
                ),
              ),
            ),
            new Container(
              color: Colors.blueGrey,
              child: new Center(
                child: new Text(
                  "Second",
                  style: textStyle(),
                ),
              ),
            ),
            new Container(
              color: Colors.teal,
              child: new Center(
                child: new Text(
                  "Third",
                  style: textStyle(),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Date'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
        
  ),
);
    }
  }
}

class Home extends StatelessWidget {
  //HTTP연결해서 앨범개수와 날짜별 이미지 가져오기
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          //key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              showImage(),
            ],
          ),
        ));
  }
}

class Date extends StatelessWidget {
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/flutter-icon.png',
      fit: BoxFit.contain,
      height: 50,
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon.png',
      fit: BoxFit.contain,
      height: 50,
    ); 
  }
}
class Me extends StatelessWidget {
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon.png',
      fit: BoxFit.contain,
      height: 50,
    );
  }
}

  Widget showDate() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: new Text(
        'Yesterday 22:17 ',
        style: TextStyle(color: Colors.orange[300], fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }
  Widget showImage() {
    getPhotos();
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),

    );
  }

  void getPhotos () async{
  String username = 'admin';
  String password = 'here123';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
    'authorization': basicAuth
 };

  Response r = await get('http://192.168.86.36:3000/api/albums/thing/list/',
  headers: headers);
  print(r.statusCode);
  print(r.body);
  print(r.headers);

  

}


  textStyle() {
      return new TextStyle(color: Colors.white, fontSize: 30.0);
    }