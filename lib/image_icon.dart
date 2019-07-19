import 'package:flutter/material.dart';
import 'package:flutter_app/utils/icon.dart';

class TestImageIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('IMAGE/ICON'),
      ),
      body: new ListView(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                width: 90.0,
                height: 80.0,
                child: new Image(
                  image: AssetImage('images/avatar.png'),
                  fit: BoxFit.fill,
                ),
              ),
              new Text('Boxfit.fill')
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                width: 90.0,
                height: 80.0,
                child: new Image(
                  image: AssetImage('images/avatar.png'),
                  fit: BoxFit.contain,
                ),
              ),
              new Text('Boxfit.contain')
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                width: 90.0,
                height: 80.0,
                child: new Image(
                  image: AssetImage('images/avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
              new Text('Boxfit.cover')
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                width: 90.0,
                height: 80.0,
                child: new Image(
                  image: AssetImage('images/avatar.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              new Text('Boxfit.fitWidth')
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                width: 90.0,
                height: 80.0,
                child: new Image(
                  image: AssetImage('images/avatar.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              new Text('Boxfit.fitHeight')
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                width: 90.0,
                height: 80.0,
                child: new Image(
                  image: AssetImage('images/avatar.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
              new Text('Boxfit.scaleDown')
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                width: 90.0,
                height: 80.0,
                child: new Image(
                  image: AssetImage('images/avatar.png'),
                  fit: BoxFit.none,
                ),
              ),
              new Text('Boxfit.none')
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                width: 90.0,
                height: 80.0,
                child: new Image(
                  image: AssetImage('images/avatar.png'),
                  color: Colors.blue,
                  colorBlendMode: BlendMode.difference,
                ),
              ),
              new Text('BlendMode.difference')
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                child: new Image(
                  image: AssetImage('images/avatar.png'),
                  width: 100.0,
                  height: 200.0,
                  repeat: ImageRepeat.repeatY,
                ),
              ),
              new Text('ImageRepeat.repeatY')
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(MyIcons.longmao, color: Colors.red,),
              new Icon(MyIcons.longmao_, color: Colors.blue,),
              new Icon(MyIcons.fangdajing, color: Colors.yellow,),
              new Text(
                'MyIcons.longmao longmao_ fangdajing',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(

                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
