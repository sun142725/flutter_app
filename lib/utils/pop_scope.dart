import 'package:flutter/material.dart';
class PopScope extends StatefulWidget{
  @override
  _PopScopeState createState() => new _PopScopeState();
}
class _PopScopeState extends State<PopScope>{
  DateTime _lasePressAt;
  bool showTip = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
        child:  new Positioned(
          child:  showTip ? new Text('1秒内点击两次退出') : new Text(''),
          bottom: 20.0,
        ),
        onWillPop: () async {
          if(_lasePressAt == null || DateTime.now().difference(_lasePressAt) > Duration(seconds: 1)){
            _lasePressAt = DateTime.now();
            if(!showTip){
              setState(() {
               showTip = true;
              });
            }
            Future.delayed(Duration(seconds: 2)).then((e){
              if(showTip){
                setState(() {
                  showTip = false;
                });
              }
            });
            return false;
          }
          return true;
        });
  }
}