import 'package:flutter/widgets.dart';

class MineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MineWidgetState();
  }
}

class MineWidgetState extends State<MineWidget> {
  @override
  Widget build(BuildContext content) {
    return Center (
      child: Text('我的')
    );
  }
}