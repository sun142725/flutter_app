import 'package:flutter/material.dart';

class TestDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showDeleteConfirmDialog1(){
      return showDialog<bool>(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text('提示'),
              content: Text('你确定要删除该文件吗？'),
              actions: <Widget>[
                FlatButton(
                  child: Text("取消"),
                  onPressed: () => Navigator.of(context).pop(), // 关闭对话框
                ),
                FlatButton(
                  child: Text("删除"),
                  onPressed: () => Navigator.of(context).pop(true), // 关闭对话框
                ),
              ],
            );
          }
      );
    }
    Future<void> changeLanguage() async {
      int i = await showDialog<int>(
//        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.of(context).pop(2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        }
      );
      print(i);
      if(i != null){
        return i;
      }
    }
     Future<void> showListDialog() async{
      int i = await showDialog(
        context: context,
        builder: (BuildContext context){
          return Dialog(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('plase select'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        title: Text("$index"),
                        onTap: (){
                          Navigator.of(context).pop(index);
                        },
                      );
                    }
                  ),
                )

              ],
            )
          );
        }
      );
      print(i);
     }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('dialog'),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('对话框1'),
              onPressed: showDeleteConfirmDialog1
          ),
          new RaisedButton(
            child: new Text('对话框2'),
              onPressed: changeLanguage
          ),
          new RaisedButton(
            child: new Text('对话框3'),
              onPressed: showListDialog
          ),
        ],
      ),
    );


  }

}