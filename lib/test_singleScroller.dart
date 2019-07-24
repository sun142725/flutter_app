import 'package:flutter/material.dart';

class TestSingleChildScrollView extends StatelessWidget{
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('singChildScrollView'),
      ),
      body: new Scrollbar(
          child: new SingleChildScrollView(
            padding: new EdgeInsets.all(16.0),
            child: new Center(
              child: new Column(
                children: str.split('').map((e)=>Text(e, textScaleFactor: 2.0,)).toList(),
              ),
            ),
          )
      ),
    );
  }
}