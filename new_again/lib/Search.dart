import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SearchPage();
}

class _SearchPage extends State<SearchPage>{

  @override

//final formKey = new GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            
            tabs: [
              new Tab(icon: new Icon(Icons.place),text: "Place",),
              new Tab(icon: new Icon(Icons.create_new_folder), text: "Thing",),
              new Tab(icon: new Icon(Icons.people),text: "Person",),
            ],
          ),
      title: new Text(
            'OwnPhoto',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0),
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

        
  ),
);
  }
  textStyle() {
      return new TextStyle(color: Colors.white, fontSize: 30.0);
    }
}
