import 'package:flutter/material.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';

class PersonalView extends StatefulWidget {
  @override
  _PersonalViewState createState() => _PersonalViewState();
}

class _PersonalViewState extends State<PersonalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "个人中心",
          style: WjStyle.appBarStyle,
        ),
        backgroundColor: WJColors.color_F5F6F7,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text("个人中心"),
      ),
    );
  }
}
