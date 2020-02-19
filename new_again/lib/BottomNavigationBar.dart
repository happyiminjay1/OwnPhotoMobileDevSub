import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'CreateFullPage.dart';
import 'PDate.dart';
import 'Person.dart';
import 'Photo.dart';
import 'login_signup_page.dart';
import 'dart:convert';
import 'dart:io';
import 'PhotoList.dart';

import 'main.dart';

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
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            
            tabs: [
              new Tab(icon: new Icon(Icons.style)),
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
            Thing(),
            People(),
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

class Me extends StatelessWidget {
  //HTTP연결해서 앨범개수와 날짜별 이미지 가져오기
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          //key: _formKey,
          child: new ListView(
      
          ),
        ));
  }
}

class Home extends StatelessWidget {
  //HTTP연결해서 앨범개수와 날짜별 이미지 가져오기
  @override
  Widget build(BuildContext context) {
    Map<String, String> headersMap = {
     'Cookie' : cookie
    };
    /*return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          //key: _formKey,
          child: new ListView(
      
          ),
        ));*/
    
    return FutureBuilder<String>(
    future: getPhotos3(), // a previously-obtained Future<String> or null
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      Widget wid;
      if (snapshot.hasData) {        
        wid =
          Column(
          children: <Widget>[
              GridView.extent(
              maxCrossAxisExtent: 150,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              shrinkWrap : true,
              children:  _buildGridTileList3(user2.results.length,headersMap,context))
            //showCircularProgress(),
          ],
          );

      }
      else if (snapshot.hasError) {
        wid = 
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          );
      } 
      else {
       wid =
          Center(child: CircularProgressIndicator());
    }

      return wid;
    }
    );
  }
}


class Date extends StatelessWidget {
  Map<String, String> headersMap = {
    'Cookie' : cookie
  };

  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: getDateInfo('http://192.168.86.24:3000/api/albums/date/photohash/list/'), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          Widget wid;
          if (snapshot.hasData) {
            wid=showYearColumn(2020, 1,headersMap);
          }
          else if (snapshot.hasError) {
            wid =
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                );
          }
          else {
            wid =
                Center(child: CircularProgressIndicator());
          }

          return wid;
        }
    );

  }

}
Widget showYearColumn(var year,var maxMonth,Map<String, String> headersMap){

  return Column(
    children:<Widget>[
      Text("$year\n",
          style: TextStyle(fontWeight: FontWeight.bold
          )
      ),
      Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children:[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                showMonthRow(1,headersMap),
                showMonthRow(2,headersMap),
                showMonthRow(3,headersMap),

              ]
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0,10,0,10)
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              showMonthRow(4,headersMap),
              showMonthRow(5,headersMap),
            ],
          ),
        ],
      )
    ],
  );
}

Widget showMonthRow(var month,Map<String, String> headersMap){
  var monthName = ["NULL","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];

  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children : [
        Center(
            child: Text(monthName[month]+"\n")
        ),
        Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.4),
                spreadRadius: 3,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
          ),
          child: Image.network('http://192.168.86.24:3000/media/photos/'+user.results[month-1].photos[0].imagehash+'.jpg',
                headers: headersMap,
                fit: BoxFit.contain,))
      ],
  );
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

class Thing extends StatefulWidget {
  @override
  ThingState createState() {
    return new ThingState(); // there is no need of new here, we are already using Dart 2.0 +
  }
}

class ThingState extends State<Thing> {
  
  Map<String, String> headersMap = {
  'Cookie' : cookie
  };
  
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
    future: getPhotos(), // a previously-obtained Future<String> or null
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      Widget wid;
      if (snapshot.hasData) {        
        List<String> stringList =[];
        print('YYYYY');
        print(user.results[0].title);
        for(int i = 0; i<user.results.length; i++)
        {
          stringList.add(user.results[i].title);
        }
        wid =
          Column(
          children: <Widget>[
              ExpansionTile(
          title: new Text('Thing'),
          children: <Widget>[
            //lookHere
            Container(
              constraints: BoxConstraints(maxHeight: 150),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                
              children: List.generate(
                user.results.length,(i) => ListTile(
                  title: Text(user.results[i].title),
                  onTap: () {
                  this.setState(() {
                    stateThing = i;
                  });
                  }        
              ),
              ),
              ),
            ),
          ]
        ),
              GridView.extent(
              maxCrossAxisExtent: 150,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              shrinkWrap : true,
              children:  _buildGridTileList(user.results[stateThing].coverphotos.length,headersMap,context))
            //showCircularProgress(),
          ],
          );

      }
      else if (snapshot.hasError) {
        wid = 
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          );
      } 
      else {
       wid =
          Center(child: CircularProgressIndicator());
    }

      return wid;
    }
    );
    /*
    return GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(user.results[0].coverphotos.length,headersMap,context));*/
  }
}

class People extends StatefulWidget {
  @override
  PeopleState createState() {
    return new PeopleState(); // there is no need of new here, we are already using Dart 2.0 +
  }
}

class PeopleState extends State<People> {
  
  Map<String, String> headersMap = {
  'Cookie' : cookie
  };
  
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
    future: getPhotos2(), // a previously-obtained Future<String> or null
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      Widget wid;
      if (snapshot.hasData) {        
        List<String> stringList =[];
        print('YYYYY');
        
        for(int i = 0; i<user.results.length; i++)
        {
          stringList.add(user.results[i].name);
        }
        wid =
          Column(
          children: <Widget>[
              ExpansionTile(
          title: new Text('People'),
          children: <Widget>[
            //lookHere
            Container(
              constraints: BoxConstraints(maxHeight: 150),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                
              children: List.generate(
                user.results.length,(i) => ListTile(
                  title: Text(user.results[i].name),
                  onTap: () {
                  this.setState(() {
                    statePeople = i;
                  });
                  }        
              ),
              ),
              ),
            ),
          ]
        ),
              GridView.extent(
              maxCrossAxisExtent: 150,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              shrinkWrap : true,
              children:  _buildGridTileList2(user.results[statePeople].personPhotos.length,headersMap,context))
            //showCircularProgress(),
          ],
          );

      }
      else if (snapshot.hasError) {
        wid = 
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          );
      } 
      else {
       wid =
          Center(child: CircularProgressIndicator());
    }

      return wid;
    }
    );
  }
}

List<Container> _buildGridTileList(int count, Map<String, String> headersMap,BuildContext context) { 
  return List.generate(
    count, (i) => Container(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>FullPage(
            'http://192.168.86.24:3000/media/photos/'+user.results[stateThing].coverphotos[i].imagehash+'.jpg',
            headersMap
          )));
        },
        child: 
        Image.network('http://192.168.86.24:3000/media/photos/'+user.results[stateThing].coverphotos[i].imagehash+'.jpg',
        headers: headersMap
        )
      ),
    )
);
}

List<Container> _buildGridTileList2(int count, Map<String, String> headersMap,BuildContext context) { 
  return List.generate(
    count, (i) => Container(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>FullPage(
            'http://192.168.86.24:3000/media/photos/'+user.results[statePeople].personPhotos[i].imagehash+'.jpg',
            headersMap
          )));
        },
        child: 
        Image.network('http://192.168.86.24:3000/media/photos/'+user.results[statePeople].personPhotos[i].imagehash+'.jpg',
        headers: headersMap
        )
      ),
    )
);
}

List<Container> _buildGridTileList3(int count, Map<String, String> headersMap,BuildContext context) { 
  return List.generate(
    count, (i) => Container(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>FullPage(
            'http://192.168.86.24:3000/media/photos/'+user2.results[i].imagehash+'.jpg',
            headersMap
          )));
        },
        child: 
        Image.network('http://192.168.86.24:3000/media/photos/'+user2.results[i].imagehash+'.jpg',
        headers: headersMap
        )
      ),
    )
);
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

Future<String> getPhotos () async{
  String username = 'admin';
  String password = 'here1234';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
    'authorization': basicAuth
 };

  Response r = await get('http://192.168.86.24:3000/api/albums/thing/list/',
  headers: headers);
  print(r.statusCode);
  print(r.body);
  print(r.headers);

  Map userMap = jsonDecode(r.body);
  user = Photo.fromJson(userMap);
  print("*****************************");
  print(user.results[0].coverphotos[1].imagehash);
  print(user.results[0].coverphotos.length);  
  print("function end!");

  return 'finished';
}

Future<String> getPhotos2 () async{
  String username = 'admin';
  String password = 'here1234';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
    'authorization': basicAuth
 };

  Response r = await get('http://192.168.86.24:3000/api/albums/person/',
  headers: headers);
  print(r.statusCode);
  print(r.body);
  print(r.headers);

  Map userMap = jsonDecode(r.body);

  user = Person.fromJson(userMap);
  print("*****************************");
  print(user.results[0].personPhotos[0].imagehash);
  print(user.results.length.toString());  
  print("function end!");

  return 'finished';
}

Future<String> getPhotos3 () async{
  String username = 'admin';
  String password = 'here1234';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
    'authorization': basicAuth
 };

  Response r = await get('http://192.168.86.24:3000/api/photos/list',
  headers: headers);
  print(r.statusCode);
  print(r.body);
  print(r.headers);

  Map userMap = jsonDecode(r.body);

  user2 = PhotoList.fromJson(userMap);
  print("*****************************");
  print(user2.results[0].imagehash);
  print(user2.results.length.toString());  
  print("function end!");

  return 'finished';
}

//Problem : getPhotos doesn't asynchroci
textStyle() {
  return new TextStyle(color: Colors.white, fontSize: 30.0);
}

//날짜
Future<String> getDateInfo (String url) async{
  String username = 'admin';
  String password = 'here1234';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
    'authorization': basicAuth
  };

  Response r = await get(url,
      headers: headers);
  print(r.statusCode);
  print(r.body);
  print(r.headers);

  Map userMap = jsonDecode(r.body);
  user = PDate.fromJson(userMap);
  print("***************DATE**************");
  print(url);
  print(user.results[0].time);
  print(user.results[0].photos[0].imagehash);
  print(user.results.length);
  print("function end!");
  return 'finished';
}