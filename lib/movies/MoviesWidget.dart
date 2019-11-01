import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MoviesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoviesWidgetState();
  }
}

class MoviesWidgetState extends State<MoviesWidget> {
  @override
  Widget build(BuildContext content) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
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
                            Center(
                              child: Text('热映')
                            ),
                            Center(
                              child: Text('上映')
                            )
                          ],
                        )
                      )
                    )
                  ],
                )))
      ],
    );
  }
}