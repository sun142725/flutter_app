import 'package:flutter/material.dart';

class TestSingleChildScrollView extends StatefulWidget{
  _TestSingleChildScrollViewState createState()=> new _TestSingleChildScrollViewState();
}
class _TestSingleChildScrollViewState extends State<TestSingleChildScrollView>{
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  bool showBtn = false;
  ScrollController _controller = new ScrollController();
  String _progress = '0%';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      print(_controller.offset);
      if(_controller.offset < 100 && showBtn){
        setState(() {
          showBtn = false;
        });
      } else if(_controller.offset > 100 && !showBtn){
        setState(() {
          showBtn = true;
        });
      }
    });
  }
  @override //  防止内存泄漏
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('试试打印');
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('singChildScrollView'),
      ),
      body: new Scrollbar(
          child: new NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification){
                double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
                setState(() {
                  _progress = "${(progress * 100).toInt()}%";
                });
                //  return ture不显示滚动条
                return true;
              },
              child: new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new SingleChildScrollView(
                    padding: new EdgeInsets.all(16.0),
                    controller: _controller,
                    child: new Center(
                      child: new Column(
                        children: str.split('').map((e)=>Text(e, textScaleFactor: 2.0,)).toList(),
                      ),
                    ),
                  ),
                  new Positioned(
                     right: 20.0,
                      child: new CircleAvatar(
                        radius: 30.0,
                        child: new Text(_progress),
                        backgroundColor: Colors.black54,
                      )
                  ),
                ],
              )
          )
      ),
      floatingActionButton: !showBtn ? null : new FloatingActionButton(
          child: new Icon(Icons.arrow_upward),
          onPressed: (){
            _controller.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.ease);
          }
      ),
    );
  }
}