import 'package:flutter/material.dart';
class TestGrid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('GridView'),
        centerTitle: true,
      ),
      body: new InfiniteGrid(),
    );
  }
}
class InfiniteGrid extends StatefulWidget{
  @override
  _InfiniteGridState createState()=> _InfiniteGridState();
}

class _InfiniteGridState extends State<InfiniteGrid>{
  List<IconData> _icons = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveIcon();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3
        ),
        itemCount: _icons.length,
        itemBuilder: (BuildContext context, int index){
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcon();
          }
          return new Icon(_icons[index]);
        }
    );
  }
  _retrieveIcon(){
    Future.delayed(Duration(seconds: 2)).then((e){
     setState(() {
       _icons.addAll([
         Icons.ac_unit,
         Icons.airport_shuttle,
         Icons.all_inclusive,
         Icons.beach_access, Icons.cake,
         Icons.free_breakfast
       ]);
     });
    });
  }
}