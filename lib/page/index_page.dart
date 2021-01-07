import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';
import 'package:white_jotter_app/widget/note_widget.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页",style: WjStyle.appBarStyle,),
        backgroundColor: WJColors.color_F5F6F7,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: WJColors.color_F5F6F7,
        child: ListView.builder(
          itemBuilder: (context, index) {
            // return NoteWidget();
            return Container();
          },
          itemCount: 10,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
