import 'package:flutter/material.dart';
import 'dart:math' as math;
class TestTransform extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('变换transform'),
      ),
      body: new Container(
        constraints: BoxConstraints.expand(),
//        alignment: AlignmentDirectional.topStart,
        child: new UnconstrainedBox(
          child: new Column(
            children: <Widget>[
              new Container(
                color: Colors.black,
                margin: EdgeInsets.only(bottom: 10.0),
                child: new Transform(
                  alignment: Alignment.topRight,
                  transform: new Matrix4.skewY(0.3),
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: new Text('Matrix4为4D矩阵'),
                  ),
                ),
              ),
              new Container(
                color: Colors.black,
                margin: EdgeInsets.only(bottom: 40.0),
                child: new Transform.translate(
                  offset: Offset(-20.0, -5.0),
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: new Text('translate'),
                  ),
                ),
              ),
              new Container(
                color: Colors.black,
                margin: EdgeInsets.only(bottom: 40.0),
                child: new Transform.rotate(
                  angle: math.pi/2,
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: new Text('rotate math.pi/2'),
                  ),
                ),
              ),
              new Container(
                color: Colors.black,
                margin: EdgeInsets.only(bottom: 10.0),
                child: new Transform.scale(
                  scale: 1.5,
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: new Text('scale 1.5'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}