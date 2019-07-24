import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class TestListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('无限滚动加载'),
        centerTitle: true,
      ),
      body: new InfiniteListView(),
    );
  }
}
class InfiniteListView extends StatefulWidget{
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}
class _InfiniteListViewState extends State<InfiniteListView>{
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }
  @override
  Widget build(BuildContext context) {
    Widget divider1 = new Divider(color: Colors.blue);
    Widget divider2 = new Divider(color: Colors.green);
    // TODO: implement build  加载100条数据 每次10条
    return new Column(
      children: <Widget>[
        new ListTile(title: Text('商品列表')),
        new Expanded(
            child: new ListView.separated(
              itemCount: _words.length,
              itemBuilder: (BuildContext context, int index){
                if(_words[index] == loadingTag){
                  if(_words.length-1 < 100) {
                    _retrieveData();
                    //  到底时显示加载
                    return new Container(
                      padding: new EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: new CircularProgressIndicator(strokeWidth: 2.0),
                    );
                  } else {
                    return new Container(
                      padding: new EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: new Text('没有更多了'),
                    );
                  }
                }
                return ListTile(title: Text(_words[index]));
              },
              // 分割器构造器
              separatorBuilder: (BuildContext context, int index){
                return index%2 == 0 ? divider1: divider2;
              },
            ),
        )
      ],
    );
  }
  void _retrieveData(){
    Future.delayed(Duration(seconds: 1)).then((e){
      setState(() {
        _words.insertAll(_words.length - 1, generateWordPairs().take(10).map((e) => e.asPascalCase).toList());
      });
    });
  }
}