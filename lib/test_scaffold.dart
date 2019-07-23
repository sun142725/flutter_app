import 'package:flutter/material.dart';
import 'package:flutter_app/component/my_drawer.dart';

class TestScaffold extends StatefulWidget{
  @override
  _TestScaffoldState createState() => _TestScaffoldState();
}

class _TestScaffoldState extends State<TestScaffold> with SingleTickerProviderStateMixin{
  int _selectedIndex = 1;
  static GlobalKey<ScaffoldState> _globalKey= new GlobalKey();
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this)
    ..addListener((){
      if(_tabController.indexIsChanging){
        print(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _globalKey,
      appBar: new AppBar(
        title: new Text('sacffold'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: Builder(builder: (BuildContext context) {
          return new IconButton(icon: new Icon(Icons.dashboard, color: Colors.white), onPressed: (){
//            Scaffold.of(context).openDrawer();
            _globalKey.currentState.openDrawer();
          });
        },),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.share, color: Colors.white), onPressed: (){
//            Scaffold.of(context).openDrawer();
            _globalKey.currentState.openEndDrawer();
          })
        ],
        bottom: _selectedIndex == 0 ? new TabBar(
            controller: _tabController,
            tabs: tabs.map((e)=>new Tab(text: e,)).toList()
        ): null,
      ),
      body: _selectedIndex == 0 ? new TabBarView(
        controller: _tabController,
          children: tabs.map((e){
            return new Container(
            alignment: Alignment.center,
            child: new Text(e, textScaleFactor: 5),
        );
      }).toList()): _selectedIndex == 1 ? new Text('business') : new Text('school'),
      drawer: new MyDrawer(),
      endDrawer: new MyDrawer(),
      bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('home')),
            new BottomNavigationBarItem(icon: new Icon(Icons.business), title: new Text('business')),
            new BottomNavigationBarItem(icon: new Icon(Icons.school), title: new Text('school')),
          ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: _add,
        backgroundColor: Colors.red,
      ),
    );
  }


  void _onItemTapped (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _add(){
    setState(() {
      if(_selectedIndex == 2){
        _selectedIndex--;
      } else _selectedIndex++;
    });
  }
}