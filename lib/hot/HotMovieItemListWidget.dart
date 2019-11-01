import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/hot/HotMovieData.dart';
import 'package:flutter_doubanmovie/hot/HotMovieItemWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotMoviesItemListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotMoviesItemListWidgetState();
  }
}

class HotMoviesItemListWidgetState extends State<HotMoviesItemListWidget> with AutomaticKeepAliveClientMixin {

  List<HotMovieData> hotMovies = new List<HotMovieData>();

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; //返回 true，表示不会被回收
  
  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
  }

  void _getData() async {
    List<HotMovieData> serverListData = new List();

    var response = await http.get('https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=10&client=&udid=');
    
    if (response.statusCode == 200) {
      var responseJson  = json.decode(response.body);
      for (dynamic data in responseJson['subjects']) {
        HotMovieData hotMovieData = HotMovieData.fromJson(data);
        serverListData.add(hotMovieData);
      }
      setState(() {
        hotMovies = serverListData;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (hotMovies == null || hotMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator()
      );
    } else {
      return ListView.separated(
        itemCount: hotMovies.length,
        itemBuilder: (context,index) {
          return HotMovieItemWidget(hotMovies[index]);
        },
        separatorBuilder: (content,index) {
          return Divider(
            height: 1,
            color: Colors.black26
          );
        },
      );
    }
  }
}