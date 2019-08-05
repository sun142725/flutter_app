import 'package:flutter/material.dart';
class MyDoctor extends StatefulWidget{
  _DoctorState createState () => new _DoctorState();
}
class _DoctorState extends State<MyDoctor>{
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addVisit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  final _testVisit = {
    'name': '杨超越',
    'deptName': '内分必科',
    'doctorTitleName': '副主任医师',
    'deptName': '上海复旦大学附属肿瘤医院',
    'deptName': '97%',
    'num': '1999',
  };
  final _visitList = [];
  bool _isLoading = false;
  void _addVisit([int num = 10]){
    if(_visitList.length >100){
      setState(() {
        _isLoading = false;
      });
      return;
    } else {
      setState(() {
        _isLoading = true;
      });
    }
    Future.delayed(Duration(seconds: 2))
    .then((e){
      for(int i = 0; i < num; i++){
        _visitList.addAll([_testVisit]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('家庭医生'),
        centerTitle: true,
      ),
      body: new NotificationListener(
          onNotification: (ScrollNotification note){
            if(note.metrics.pixels.toInt()/note.metrics.maxScrollExtent.toInt() == 1){
              if(_isLoading){
                print('加载');  // 滚动位置。
                _addVisit(10);
//                  if(_visitList.length-1 < 100) {
//                    _addVisit(10);
//                    //  到底时显示加载
//                    return new Container(
//                      padding: new EdgeInsets.all(16.0),
//                      alignment: Alignment.center,
//                      child: new CircularProgressIndicator(strokeWidth: 2.0),
//                    );
//                  } else {
//                    return new Container(
//                      padding: new EdgeInsets.all(16.0),
//                      alignment: Alignment.center,
//                      child: new Text('没有更多了'),
//                    );
//                  }
              }
            }
            return true;
          },
          child: new ListView(
            controller: _controller,
            scrollDirection: Axis.vertical,
            children: _visitList.map((value)=>new DecoratedBox(
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
                                new Text('服务人次: 1999', style: new TextStyle(fontSize: 12.0, color: Color(0xFF8A8F9B)))
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
                          onPressed: (){
                            print('dianji');
                            print('打印Value$value');
                          }),
                    ),
                  ],
                ),
              ),
            )).toList(),

          ),
      )
    );
  }
}