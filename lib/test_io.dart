import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
class TestIo extends StatefulWidget{
  _TestIoState createState () => new _TestIoState();
}
class _TestIoState extends State<TestIo> {
  var goodDetail = {
    'genericName': '测试',
    'drugPictureId': 'images/icon_doctor.png'
  };
  _getGoodInfo() async{
    var url = 'http://47.93.206.48:666/elephant-admin/mall/drug/info';
    var httpClient = new HttpClient();

    try{
      debugPrint('1112');

      var request = await httpClient.getUrl(new Uri.http(
          '47.93.206.48:666', '/elephant-admin/mall/drug/info'));
      var response = await request.close();
      debugPrint('111');
      if(response.statusCode == HttpStatus.OK){
        var json = await response.transform(utf8.decoder).join();
        var data = new Map.from(jsonDecode(json)['data']);
        print(data);
        setState(() {
          goodDetail = Map.castFrom(data);
        });
      } else {
        print('Error getting IP address:\nHttp status ${response.statusCode}');
      }
    }catch(exception){
      print(exception);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getGoodInfo();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('测试接口请求'),
            centerTitle: true,
          ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Container(
          child: new Column(
            children: <Widget>[
              new Image.asset('${goodDetail['drugPictureId']}',
                  width: 48.0,
                  height: 48.0),
              new Text('${goodDetail['genericName']}', style: new TextStyle(fontSize: 17.0, color: Color(0xFF222222)))
            ],
          ),
        ),
      )
    );
  }
}