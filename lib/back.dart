import 'package:flutter/material.dart';

class TestBack extends StatelessWidget{
  Widget build(BuildContext context){
    final arguments = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('测试返回')
      ),
      body: new Text('查看默认返回按钮是否存在$arguments'),
    );
  }
}