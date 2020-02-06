import 'package:flutter/material.dart';
import 'login_signup_page.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class Practice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PracticeState();
}

class _PracticeState extends State<Practice>{

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Date',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: Me',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
    Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(255, 185, 219, 142),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0,0, 40, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.asset(
                   'assets/OwnPhotoBW.png',
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
       body: Stack(
          children: <Widget>[
            showForm2(),
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 200.0, 0.0, 0.0),
              child :
                _widgetOptions.elementAt(_selectedIndex)
            ),
            //showCircularProgress(),
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
       );
  }
}

Widget showForm2() {

    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          //key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              showDate(),
              //showImage(),
              //showPasswordInput(),
              //showPrimaryButton(),
              //showSecondaryButton(),
              //showErrorMessage(),
            ],
          ),
        ));
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: new Text(
        'Yesterday 22:17 ',
         style: TextStyle(color: Colors.orange[300], fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }
/*
_getImageList() async {
    var resultList = await MultiImagePicker.pickImages(
      maxImages :  10 ,
      enableCamera: true,
    );
    
    // The data selected here comes back in the list
    print(resultList);
    for ( var imageFile in resultList) {
         postImage(imageFile).then((downloadUrl) {
            // Get the download URL
            print(downloadUrl.toString());
         }).catchError((err) {
           print(err);
         });
    }
}
Future<dynamic> postImage(Asset imageFile) async {
    await imageFile.requestOriginal();
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = reference.putData(imageFile.imageData.buffer.asUint8List());
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    return storageTaskSnapshot.ref.getDownloadURL();
  }*/
