import 'package:flutter/material.dart';

class TestDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('装饰容器decoration')),
      body: new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: new UnconstrainedBox(
              child: new Column(
            children: <Widget>[
              new DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.orange]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
                child: new Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                  child: new Text('渐变加阴影'),
                ),
              ),
              new DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
                    border: Border.all(color: Colors.blue, width: 2.0, style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
                child: new Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                  child: new Text('渐变加边框'),
                ),
              ),
            ],
          ))),
    );
  }
}
