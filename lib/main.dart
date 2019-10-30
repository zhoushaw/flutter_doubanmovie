import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/hot/HotWidget.dart';
import 'package:flutter_doubanmovie/mine/MineWidget.dart';
import 'package:flutter_doubanmovie/movies/MoviesWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '豆瓣电影'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _widgetItems = [HotWidget(),MoviesWidget(),MineWidget()];

  void _onItemOnTap (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetItems[_selectedIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('热映')),
            BottomNavigationBarItem(icon: Icon(Icons.remove_red_eye), title: Text('找片')),
            BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的'))
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.black,
          onTap: _onItemOnTap,
          selectedFontSize: 12.0,
        ),
    );
  }
}
