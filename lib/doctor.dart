import 'package:flutter/material.dart';
class MyDoctor extends StatefulWidget{
  _DoctorState createState () => new _DoctorState();
}
class _DoctorState extends State<MyDoctor>{
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('家庭医生'),
        centerTitle: true,
      ),
      body: new ListView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          new Text('12222222222'),
          new Text('12222222222'),
          new Text('12222222222'),
          new Text('12222222222'),
          new Padding(
              padding: EdgeInsets.all(12.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: new Image.asset('images/icon_doctor.png',
                      width: 48.0,
                      height: 48.0
                  ),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: new Text('样超越', style: new TextStyle(fontSize: 17.0, color: Color(0xFF222222))),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child:  new Text('内分泌科', style: new TextStyle(fontSize: 13.0, color: Color(0xFF222222))),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child:  new Text('副主任医师', style: new TextStyle(fontSize: 13.0, color: Color(0xFF222222))),
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.all(0),
                          child: new Text('上海复旦大学附属肿瘤医院', style: new TextStyle(fontSize: 13.0, color: Color(0xFF222222)), textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Image.asset('images/icon_star3.png',width: 12.0,height: 12.0),
                        new Image.asset('images/icon_star3.png',width: 12.0,height: 12.0),
                        new Image.asset('images/icon_star3.png',width: 12.0,height: 12.0),
                        new Image.asset('images/icon_star3.png',width: 12.0,height: 12.0),
                        new Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: new Text('97%', style: new TextStyle(fontSize: 12.0, color: Color(0xFF8A8F9B))),
                        ),
                        new Text('服务人次: 1999', style: new TextStyle(fontSize: 12.0, color: Color(0xFF8A8F9B)))
                      ],
                    ),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}