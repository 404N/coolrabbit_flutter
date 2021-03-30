import 'package:flutter/material.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';

class FolderView extends StatefulWidget {
  @override
  _FolderViewState createState() => _FolderViewState();
}

class _FolderViewState extends State<FolderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "文件夹",
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
