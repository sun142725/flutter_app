import 'package:flutter/material.dart';

class TestStack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stack和绝对定位')
      ),
      body: new Container(
        constraints: BoxConstraints.expand(),
        color:Colors.green,
        child: new Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            new Container(
              child: new Text('111111'),
              color: Colors.yellow,
            ),
            new Positioned(
                width: 100.0,
                left: 18.0,
                child: new Text('定位1', style: new TextStyle(color: Colors.red),)
            ),
            new Positioned(
                left: 18.0,
                top: 20.0,
                child: new Text('position2', style: new TextStyle(color: Colors.blue),)
            )
          ],
        ),
      ),
    );
  }
}