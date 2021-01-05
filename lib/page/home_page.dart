import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_jotter_app/page/home_bloc/home_bloc.dart';
import 'package:white_jotter_app/page/library_page.dart';
import 'package:white_jotter_app/page/personal_page.dart';
import 'package:white_jotter_app/res.dart';

import 'note_page.dart';

class HomePage extends StatefulWidget {
  static final String sName = "Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: '分类'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: '会员中心')
  ];

  List<Widget> tabBodies = [
    HomePage(),
    NotePage(),
    LibraryPage(),
    PersonalPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc()..add(HomeInitial()),
      child:BlocBuilder<HomeBloc, HomeState>(
        builder: (context, HomeState state) {
          return Scaffold(
            body: tabBodies[0],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: state.selectIndex,
              items: bottomTabs,
              onTap: (index) {
                BlocProvider.of<HomeBloc>(context).add(HomeSwitch(index));
              },
            ),
          );
        },
      ),
    );
  }
}
