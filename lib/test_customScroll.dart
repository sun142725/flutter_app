import 'package:flutter/material.dart';
class TestCustomScrollView extends StatelessWidget{
  ScrollController _controller1 = new ScrollController();
  ScrollController _controller2 = new ScrollController();
  ScrollController _controller3 = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new CustomScrollView(
        controller: _controller1,
        slivers: <Widget>[
          new SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: new Text('dome'),
              background: Image.asset('images/lake.jpg', fit: BoxFit.cover),
            ),
          ),
          new SliverPadding(
            padding: new EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                  return new Container(
                    color: Colors.cyan[100*(index%9)],
                    alignment: Alignment.center,
                    child: new Text('grid item $index', style: new TextStyle(fontSize: 12),),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          new SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              }, childCount: 50)
          )
        ],
      ),
    );
  }
}