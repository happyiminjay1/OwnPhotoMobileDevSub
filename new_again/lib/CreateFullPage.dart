import 'package:flutter/material.dart';

class FullPage extends StatefulWidget {
  String src;
  Map<String, String> headersMap;

  FullPage(String src,Map<String, String> headersMap){
    this.src = src;
    this.headersMap = headersMap;

  }

  @override
  State<StatefulWidget> createState() {
    return new _FullPageState(src,headersMap);
  }
}

class _FullPageState extends State<FullPage>{

  String src;
  Map<String, String> headersMap;

  _FullPageState(String src,Map<String, String> headersMap)
  {
    this.src = src;
    this.headersMap = headersMap;
  }
  @override
//final formKey = new GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment(0, 0),
        child: GestureDetector(
        onTap: (){Navigator.pop(context);},
        child: 
          Image.network(
                src,
                headers: headersMap,
                fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
