import 'package:flutter/material.dart';
import 'package:flutter_app/english_words.dart';
import 'package:flutter_app/shop-cart.dart';
import 'package:flutter_app/back.dart';

class StartUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSelection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      '213213123',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  new Text(
                      'Kandersteg, Switzerland',
                      style: new TextStyle(
                          color: Colors.grey[500]
                      )
                  )
                ],
              )
          ),
          new FavoriteWidget()
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label){
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new IconButton(icon: new Icon(icon, color: color), onPressed: () {
            debugPrint('122222222222');
            debugDumpApp();
            Navigator.push(context, MaterialPageRoute(builder: (context) => new ShoppingList(
              products: <Product>[
                new Product(name: 'Eggs'),
                new Product(name: 'Flour'),
                new Product(name: 'Chocolate chips'),
              ],)));
          }),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'flutter dome',
      theme: new ThemeData(
          primaryColor: Colors.blue
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('试试'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSelection,
            buttonSection,
            textSection
          ],
        ),
      ),
      routes: {
        'english_words': (BuildContext content) => new EnglishWords(),
        'shop_cart': (BuildContext context) => new ShoppingList(),
        'Test_back': (BuildContext context) => new TestBack(),
      },
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 41;
  void _toggleFavorite () {
    debugPrint('211111111');
//     Navigator.of(context).pushNamed('Test_back');
    setState((){
      if(_isFavorite){
        _isFavorite = false;
        _favoriteCount++;
      } else {
        _isFavorite = true;
        _favoriteCount--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
            padding: new EdgeInsets.all(0.0),
            child: new IconButton(icon: _isFavorite ? new Icon(Icons.star) : new Icon(Icons.star_border), onPressed: _toggleFavorite)
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}