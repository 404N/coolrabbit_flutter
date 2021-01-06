import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_jotter_app/page/home_bloc/home_bloc.dart';
import 'package:white_jotter_app/page/index_page.dart';
import 'package:white_jotter_app/page/library_page.dart';
import 'package:white_jotter_app/page/personal_page.dart';
import 'package:white_jotter_app/res.dart';

import 'note_page.dart';

class HomePage extends StatefulWidget {
  static final String sName = "Home";
  BuildContext context;

  HomePage(this.context);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.pencil), label: '笔记本'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.command), label: '动态'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: '个人中心')
  ];

  List<Widget> tabBodies;
  PageController _pageController=PageController();

  @override
  void initState() {
    super.initState();
    tabBodies = [
      IndexPage(),
      NotePage(),
      LibraryPage(),
      PersonalPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc()..add(HomeInitial()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, HomeState state) {
          return Scaffold(
            body: PageView.builder(
              //要点1
              physics: NeverScrollableScrollPhysics(),
              //禁止页面左右滑动切换
              controller: _pageController,
              //回调函数
              itemCount: 4,
              itemBuilder: (context, index) => tabBodies[index],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: state.selectIndex,
              items: bottomTabs,
              onTap: (index) {
                _pageController.jumpToPage(index);
                BlocProvider.of<HomeBloc>(context).add(HomeSwitch(index));
              },
            ),
          );
        },
      ),
    );
  }
}
