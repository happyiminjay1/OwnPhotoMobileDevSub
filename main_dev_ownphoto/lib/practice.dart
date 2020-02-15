import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(ImagePickerApp());

class ImagePickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    title: 'Sample Imagepicker Widget',
    home : ImagePickerWidget(),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({Key key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  
  File _image;
  
  @override
  void initState(){
    super.initState();
  }

void open_camera()
 async {
  var image = await ImagePicker.pickImage(source: ImageSource.camera);
  setState(() {
    _image = image;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title: Text('Sample Imagepicker widget'),
        backgroundColor: Colors.black45),
        body : Center(
          child : Container(
            child: Column(
              children: <Widget>[
                Container(child:  _image == null ? Text("Still waiting") : Image.file(_image),),
                FlatButton(
                  child: Text("Open Camera"),
                  onPressed: (){
                    open_camera();
                  },)
              ],
            )
          )
        )
    );
  }
}