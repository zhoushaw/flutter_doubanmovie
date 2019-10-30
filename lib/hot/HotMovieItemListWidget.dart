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

class HotMoviesItemListWidgetState extends State<HotMoviesItemListWidget> {

  List<HotMovieData> hotMovies = new List<HotMovieData>();

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
      print(response.body);
    }
    // var data = HotMovieData('反贪风暴4', 6.3, '林德禄', '古天乐/郑嘉颖/林峯', 29013,
    //     'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551353482.webp');
    // setState(() {
    //   hotMovies.add(data);
    //   hotMovies.add(data);
    //   hotMovies.add(data);
    //   hotMovies.add(data);
    //   hotMovies.add(data);
    //   hotMovies.add(data);
    //   hotMovies.add(data);
    //   hotMovies.add(data);
    // });  
    return null;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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