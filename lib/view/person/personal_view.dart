import 'package:flutter/material.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';
import 'package:white_jotter_app/utils/common/widget_extention_util.dart';
import 'package:white_jotter_app/view/person/login_view.dart';

class PersonalView extends StatefulWidget {
  @override
  _PersonalViewState createState() => _PersonalViewState();
}

class _PersonalViewState extends State<PersonalView> with AutomaticKeepAliveClientMixin {
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
      body: Container(
        height: 60,
        width: 120,
        color: Colors.blue,
        child: Center(
          child: Text("登陆"),
        ),
      ).gestureDetectorExtension(
        () => Navigator.pushNamed(context, LoginView.sName),
      ),
    );
  }

  @override
  bool wantKeepAlive = true;
}
