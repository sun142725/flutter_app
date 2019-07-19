import 'package:flutter/material.dart';
import 'package:flutter_app/input_form.dart';
import 'package:flutter_app/english_words.dart';
import 'package:flutter_app/back.dart';
import 'package:flutter_app/start_ui.dart';
import 'package:flutter_app/test_flow.dart';
import 'package:flutter_app/image_icon.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'flutter',
      theme: new ThemeData(
          primaryColor: Colors.red
      ),
      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
            title: new Text(
              'flutter app',
              textAlign: TextAlign.center
            ),
        ),
          body: new Container(
              decoration: BoxDecoration(color: Colors.white),
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 80.0,
              ),
              child: new ListView(
                children: <Widget>[
                  new MainBody(),
                ],
              )
          ),
      ),
      routes: {
        'input_form': (BuildContext context) => new InputF(),
        'english_words': (BuildContext context) => new EnglishWords(),
        'test_back': (BuildContext context) => new TestBack(),
        'start_ui': (BuildContext context) => new StartUI(),
        'test_flow': (BuildContext context) => new TestFlow(),
        'image_icon': (BuildContext context) => new TestImageIcon(),
      },
    );
  }
}

class MainBody extends StatefulWidget{
  _mainBody createState() => new _mainBody();
}
class _mainBody extends State<MainBody>{
  final _tabArr = [
    {
      'icon': Icons.input,
      'title': '登录',
      'routeName': 'input_form'
    },
    {
      'icon': Icons.input,
      'title': '登录',
      'routeName': 'input_form'
    },
    {
      'icon': Icons.input,
      'title': '登录',
      'routeName': 'input_form'
    },
    {
      'icon': Icons.input,
      'title': '登录',
      'routeName': 'input_form'
    },
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Wrap(
      textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.down,
      alignment: WrapAlignment.start,
      spacing: 8.0,
      runSpacing: 4.0,
      children: <Widget>[
        new Container(
          width: 80.0,
          child: new Column(
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.input, color: Colors.red), onPressed: (){
                Navigator.of(context).pushNamed('input_form');
              }),
              new Text('登录', textAlign: TextAlign.center, style: TextStyle(),)
            ],
          ),
        ),
        new Container(
          width: 80.0,
          child:  new Column(
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.language, color: Colors.red), onPressed: (){
                Navigator.of(context).pushNamed('english_words');
              }),
              new Text('英语滚动')
            ],
          ),
        ),
        new Container(
          width: 80.0,
            child: new Column(
              children: <Widget>[
                new IconButton(icon: new Icon(Icons.arrow_back, color: Colors.red), onPressed: (){
                  Navigator.of(context).pushNamed('test_back', arguments: {1:2, 2:3});
                }),
                new Text('路由传参')
              ],
            ),
        ),
        new Container(
          width: 80.0,
          child: new Column(
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.home, color: Colors.red), onPressed: (){
                Navigator.of(context).pushNamed('start_ui');
              }),
              new Text('home')
            ],
          ),
        ),
        new Container(
          width: 80.0,
          child: new Column(
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.local_florist, color: Colors.red), onPressed: (){
                Navigator.of(context).pushNamed('test_flow');
              }),
              new Text('flow')
            ],
          ),
        ),
        new Container(
          width: 80.0,
          child: new Column(
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.image, color: Colors.red), onPressed: (){
                Navigator.of(context).pushNamed('image_icon');
              }),
              new Text('image_icon')
            ],
          ),
        ),
      ],
    );
  }
}
