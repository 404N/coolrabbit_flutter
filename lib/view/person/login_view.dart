import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_jotter_app/utils/common/widget_extention_util.dart';
import 'package:white_jotter_app/utils/style/Box.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';
import 'package:white_jotter_app/viewmodel/login_viewmodel.dart';
import 'package:white_jotter_app/viewmodel/service_locator.dart';

class LoginView extends StatefulWidget {
  static final String sName = "Login";

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel model = serviceLocator<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => model,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "登陆",
            style: WjStyle.appBarStyle,
          ),
          centerTitle: true,
        ),
        body: Consumer<LoginViewModel>(
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Box.h25,
                  Box.h25,
                  Box.h25,
                  Container(
                    child: Center(
                      child: Text(
                        "登陆",
                        style: WjStyle.loginStyle,
                      ),
                    ),
                  ),
                  Box.h10,
                  Center(
                    child: Icon(
                      Icons.account_circle,
                      size: 150,
                    ),
                  ),
                  Box.h5,
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: model.userName,
                    ),
                  ),
                  Box.h10,
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: model.password,
                    ),
                  ),
                  Box.h10,
                  Container(
                    height: 60.H,
                    width: 120.W,
                    color: WJColors.color_306BFF,
                    child: Center(
                      child: Text("登录"),
                    ),
                  ).gestureDetectorExtension(
                    () => model.login(context),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
