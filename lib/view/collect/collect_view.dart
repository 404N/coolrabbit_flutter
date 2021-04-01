import 'package:flutter/material.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';

class CollectView extends StatefulWidget {
  @override
  _CollectViewState createState() => _CollectViewState();
}

class _CollectViewState extends State<CollectView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "我的收藏",
          style: WjStyle.appBarStyle,
        ),
        backgroundColor: WJColors.color_F5F6F7,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
