import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
class MyDoctor extends StatefulWidget{
  _DoctorState createState () => new _DoctorState();
}
class _DoctorState extends State<MyDoctor>{
  var _ipAddress = 'Unknown';
  ScrollController _controller = new ScrollController();
  final _loadingTag = '##loading##';

  final _testVisit = {
    'name': '杨超越',
    'deptName': '内分必科',
    'doctorTitleName': '副主任医师',
    'deptName': '上海复旦大学附属肿瘤医院',
    'deptName': '97%',
    'num': '1999',
  };
  List _visitList = new List();
  bool _isLoading = true;
  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();
    Navigator.of(context).pop(true);

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
//      if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }




  void changeIsLoading(bool load){
    setState(() {
      _isLoading = load;
    });
  }
  void _addVisit([int num = 10]){
    changeIsLoading(false);
    Future.delayed(Duration(seconds: 2))
    .then((e){
      setState(() {
        _visitList.insertAll(_visitList.length -1, [_testVisit,_testVisit,_testVisit,_testVisit,_testVisit,_testVisit,_testVisit]);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _visitList.add(_loadingTag);
    _addVisit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2))
    .then((e){
      setState(() {
        _visitList = [];
        _isLoading = true;
        _visitList.add(_loadingTag);
        _addVisit();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    弹窗
    Future<bool> showDeleteConfirmDialog1() {
      return showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('提示'),
              content: Text('你确定要删除该文件吗？'),
              actions: <Widget>[
                FlatButton(
                  child: Text("取消"),
                  onPressed: () => Navigator.of(context).pop(), // 关闭对话框
                ),
                FlatButton(
                  child: Text("获取ip地址"),
                  onPressed: _getIPAddress, // 关闭对话框
                ),
              ],
            );
          }
      );
    }
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('家庭医生'),
        centerTitle: true,
      ),
      body: new NotificationListener(
          onNotification: (ScrollNotification note){
            if(note.metrics.pixels.toInt()/note.metrics.maxScrollExtent.toInt() == 1){
              changeIsLoading(true);
            }
            return true;
          },
          child: new RefreshIndicator(
            onRefresh: _onRefresh,
            child: new ListView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: _visitList.map((value){
                if(value == _loadingTag){
                  if(_visitList.length-1 < 100 &&  _isLoading) {
                    _addVisit(10);
                    //  到底时显示加载
                    return new Container(
                      padding: new EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: new CircularProgressIndicator(strokeWidth: 2.0),
                    );
                  } else {
                    changeIsLoading(false);
                    return new Container(
                      padding: new EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: new Text('没有更多了~'),
                    );
                  }
                } else {
                  return new DecoratedBox(
                    decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: Color(0xFFE9E9E9)
                            )
                        )
                    ),
                    child: new Padding(
                      padding: EdgeInsets.all(12.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: new Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  new Image.asset('images/icon_doctor.png',
                                      width: 48.0,
                                      height: 48.0
                                  ),
                                  Positioned(
                                    left: 21,
                                    bottom: -3.0,
                                    child: new SizedBox(
                                      width: 7.0,
                                      height: 7.0,
                                      child: new DecoratedBox(
                                        decoration: new BoxDecoration(color: Color(0xFFB8E986), borderRadius: BorderRadius.circular(7.0)),
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),
                          new Expanded(
                            child:  new Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                verticalDirection: VerticalDirection.down,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.only(right: 8.0, bottom: 2.0),
                                        child: new Text('${value['name']}', style: new TextStyle(fontSize: 17.0, color: Color(0xFF222222))),
                                      ),
                                      new Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: new Text('内分泌科', style: new TextStyle(fontSize: 13.0, color: Color(0xFF222222))),
                                      ),
                                      new Text('副主任医师', style: new TextStyle(fontSize: 13.0, color: Color(0xFF222222))),
                                    ],
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.only(bottom: 5.0),
                                        child: new Text('上海复旦大学附属肿瘤医院', style: new TextStyle(fontSize: 13.0, color: Color(0xFF222222)), textAlign: TextAlign.left, overflow: TextOverflow.ellipsis),
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
                                      new Text('服务人次: $_ipAddress', style: new TextStyle(fontSize: 12.0, color: Color(0xFF8A8F9B)))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          new SizedBox(
                            width: 42.0,
                            height: 20.0,
                            child: new RaisedButton(
                                child: new Text('绑定', style: new TextStyle(fontSize: 12.0)),
                                color: new Color(0xFF009ADE),
                                textColor: Colors.white,
                                padding: new EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                onPressed: showDeleteConfirmDialog1
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }).toList(),
            ),
          ),
      )
    );
  }
}
