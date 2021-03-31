import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:white_jotter_app/utils/style/Box.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';
import 'package:white_jotter_app/utils/common/ScreenUtils.dart';
import 'package:white_jotter_app/widget/folder_widget/floder_or_note_widget.dart';

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
        actions: [
          AspectRatio(
            aspectRatio: 1,
            child: Center(
              child: Container(
                height: 30.H,
                width: 30.H,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.H),
                  ),
                  border: Border.all(
                    width: 1,
                    color: WJColors.color_CCCCCC,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: WJColors.color_CCCCCC.withOpacity(0.2),
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                  color: WJColors.color_F5F6F7,
                ),
                child: PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      value: '0',
                      child: Text('新建文件夹'),
                    ),
                    PopupMenuItem<String>(
                      value: '1',
                      child: Text('按修改时间'),
                    ),
                    PopupMenuItem<String>(
                      value: '2',
                      child: Text('按创建时间'),
                    ),
                  ],
                  onSelected: (String action) {
                    // 点击选项的时候
                    switch (action) {
                      case '0':
                        break;
                      case '1':
                        break;
                      case '2':
                        break;
                    }
                  },
                ),
              ),
            ),
          ),
          Box.w15,
        ],
      ),
      body: Container(
        color: WJColors.color_F5F6F7,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.W, right: 15.W),
              child: EasyRefresh.custom(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (build, index) {
                        if (index == 0) {
                          return CupertinoSearchTextField(
                            placeholder: "搜索",
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.H),
                            ),
                          );
                        } else {
                          return FolderOrNoteWidget(
                            title: "文件夹名称",
                            date: "2021.03.09",
                          );
                        }
                      },
                      childCount: 4,
                    ),
                  ),
                ],
                onRefresh: () {
                  return null;
                },
              ),
            ),
            Positioned(
              right: 10.W,
              bottom: 40.H,
              child: Container(
                height: 40.H,
                width: 40.H,
                decoration: BoxDecoration(
                  color: WJColors.color_306BFF,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.H),
                  ),
                  border: Border.all(width: 0.5, color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: WJColors.color_306BFF.withOpacity(0.5),
                      offset: Offset(-1.0, -1.0),
                      blurRadius: 0,
                      spreadRadius: 0.5,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      WJColors.color_306BFF,
                      WJColors.color_306BFF.withOpacity(0.5),
                    ],
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: WJColors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
