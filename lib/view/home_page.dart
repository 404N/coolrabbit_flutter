import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_jotter_app/utils/style/icons.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';
import 'package:white_jotter_app/view/collect/collect.dart';
import 'package:white_jotter_app/view/folder/folder.dart';
import 'package:white_jotter_app/view/news/news.dart';
import 'package:white_jotter_app/view/person/personal.dart';
import 'package:white_jotter_app/viewmodel/home_viewmodel.dart';
import 'package:white_jotter_app/viewmodel/service_locator.dart';

class HomePage extends StatefulWidget {
  static final String sName = "Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(AppIcons.unNews),
      activeIcon: Icon(
        AppIcons.news,
      ),
      label: '最新',
    ),
    BottomNavigationBarItem(
      icon: Icon(AppIcons.unFolder),
      activeIcon: Icon(
        AppIcons.folder,
      ),
      label: '文件夹',
    ),
    BottomNavigationBarItem(
      icon: Icon(AppIcons.unCollect),
      activeIcon: Icon(
        AppIcons.collect,
      ),
      label: '收藏',
    ),
    BottomNavigationBarItem(
      icon: Icon(AppIcons.unMy),
      activeIcon: Icon(
        AppIcons.my,
      ),
      label: '我的',
    )
  ];

  List<Widget> tabBodies;
  PageController _pageController = PageController();
  HomeIndexViewModel model = serviceLocator<HomeIndexViewModel>();

  @override
  void initState() {
    super.initState();
    tabBodies = [
      NewsView(),
      FolderView(),
      CollectView(),
      PersonalView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeIndexViewModel>(
      create: (context) => model,
      child: Consumer<HomeIndexViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                //设置背景色`BottomNavigationBar`
                canvasColor: WJColors.color_F5F6F7,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: model.index,
                items: bottomTabs,
                selectedItemColor: WJColors.color_306BFF,
                unselectedItemColor: Colors.black,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                onTap: (index) {
                  _pageController.jumpToPage(index);
                  model.switchIndex(index);
                },
              ),
            ),
          );
        },
        child: PageView.builder(
          //要点1
          physics: NeverScrollableScrollPhysics(),
          //禁止页面左右滑动切换
          controller: _pageController,
          //回调函数
          itemCount: 4,
          itemBuilder: (context, index) => tabBodies[index],
        ),
      ),
    );
  }
}
