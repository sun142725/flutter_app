import 'package:flutter/material.dart';
import 'package:flutter_app/input_form.dart';
import 'package:flutter_app/english_words.dart';
import 'package:flutter_app/back.dart';
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
        appBar: new AppBar(
            title: new Text(
              'flutter app',
              textAlign: TextAlign.center
            ),
        ),
          body: new Container(
              decoration: BoxDecoration(color: Colors.red),
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 100.0,
                maxHeight: 100.0,
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
      },
    );
  }
}

class MainBody extends StatefulWidget{
  _mainBody createState() => new _mainBody();
}
class _mainBody extends State<MainBody>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new IconButton(icon: new Icon(Icons.input), onPressed: (){
              Navigator.of(context).pushNamed('input_form');
            }),
            new Text('登录')
          ],
        ),
        new Column(
          children: <Widget>[
            new IconButton(icon: new Icon(Icons.star), onPressed: (){
              Navigator.of(context).pushNamed('english_words');
            }),
            new Text('英语滚动')
          ],
        ),
        new Column(
          children: <Widget>[
            new IconButton(icon: new Icon(Icons.star_border), onPressed: (){
              Navigator.of(context).pushNamed('test_back', arguments: '我是传过来的');
            }),
            new Text('333')
          ],
        )
      ],
    );
  }
}
