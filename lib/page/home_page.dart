import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String sName = "Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
        centerTitle: true,
      ),
      body: Text("home"),
    );
  }
}
