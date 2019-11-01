import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doubanmovie/hot/HotMovieItemListWidget.dart';

class HotWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotWidgetState();
  }
}

class HotWidgetState extends State<HotWidget> {

  String curCity = '深圳';

  @override
  Widget build(BuildContext content) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(curCity, style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pushNamed(context, '/Citys', arguments: curCity);
                },
              ),
              Icon(Icons.arrow_drop_down),
              Expanded(
                  flex: 1,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        hintText: '电影 / 电视剧 / 影人',
                        hintStyle: TextStyle(
                            fontFamily: 'MaterialIcons', fontSize: 16),
                        contentPadding: EdgeInsets.only(bottom: 8, top: 8),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        filled: true,
                        fillColor: Colors.black12),
                  ))
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints.expand(height: 50),
                      child: TabBar(
                        unselectedLabelColor: Colors.black12,
                        labelColor: Colors.black87,
                        indicatorColor: Colors.black87,
                        tabs: <Widget>[Tab(text: '正在热映'), Tab(text: '即将上映')],
                      ),
                    ),
                    Expanded(
                        child: Container(
                            child: TabBarView(
                      children: <Widget>[
                        Center(child: HotMoviesItemListWidget()),
                        Center(child: Text('上映'))
                      ],
                    )))
                  ],
                )))
      ],
    );
  }
}
