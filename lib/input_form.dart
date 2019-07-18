import 'package:flutter/material.dart';
class InputF extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(

      appBar: new AppBar(
        title: new Text('输入框跟表单'),
      ),
      body: new Column(
        children: <Widget>[
          new InputFrom(),
        ],
      ),
    );
  }
}
class InputFrom extends StatefulWidget {
  _InputFrom createState() => new _InputFrom();
}
class _InputFrom extends State<InputFrom> {
  String account = '';
  String Password = '';
  Widget _showDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return new AlertDialog(
          title: new Text('温馨提示'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('$account'),
                new Text('$Password'),
                new Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: new RaisedButton(
                    child: Text('确定'),
                    onPressed: (){
                      Navigator.pop(ctx);
                    },
                  ),
                )
              ],
            ),
          ),

        );
      }
    );
  }

  Widget _handleAccountValue (String value){
    setState(() {
      account = value;
     });
  }
  Widget _handlePasswordValue (String value){
    setState(() {
      Password = value;
    });
  }
//  void
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        new TextField(
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '请输入用户名',
            prefixIcon: new Icon(Icons.person)
          ),
          maxLength: 11,
          keyboardType: TextInputType.phone,
          onChanged: _handleAccountValue,
        ),
        new TextField(
          decoration: InputDecoration(
            labelText: '密码',
            hintText: '请输入密码',
            prefixIcon: new Icon(Icons.lock),
          ),
          maxLength: 18,
          onChanged: _handlePasswordValue,
          obscureText: true
        ),
        new RaisedButton(
          child: new Text('登录'),
          onPressed: () {
            _showDialog(context);
          }
        )
      ],
    );
  }
}