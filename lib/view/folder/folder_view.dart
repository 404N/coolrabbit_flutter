import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:white_jotter_app/utils/style/Box.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';
import 'package:white_jotter_app/utils/common/ScreenUtils.dart';
import 'package:white_jotter_app/viewmodel/folder_viewmodel.dart';
import 'package:white_jotter_app/viewmodel/service_locator.dart';
import 'package:white_jotter_app/widget/folder_widget/floder_or_note_widget.dart';
import 'package:white_jotter_app/widget/utils_widget/loading_widget.dart';

class FolderView extends StatefulWidget {
  @override
  _FolderViewState createState() => _FolderViewState();
}

class _FolderViewState extends State<FolderView>
    with AutomaticKeepAliveClientMixin {
  FolderViewModel model = serviceLocator<FolderViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      model.initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FolderViewModel>(
      create: (context) => model,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "文件夹",
            style: WjStyle.appBarStyle,
          ),
          backgroundColor: WJColors.color_F5F6F7,
          centerTitle: true,
          elevation: 0,
          actions: [
            actionAdd(),
            Box.w15,
          ],
        ),
        body: Consumer<FolderViewModel>(
          builder: (context, model, child) {
            if (model.folderList == null) {
              return LoadingWidget();
            }
            return Container(
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
                                  title: model.folderList[index - 1].folderName,
                                  date: model.folderList[index - 1].createDate,
                                );
                              }
                            },
                            childCount: model.folderList.length + 1,
                          ),
                        ),
                      ],
                      onRefresh: () {
                        return model.initData();
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
            );
          },
        ),
      ),
    );
  }

  AspectRatio actionAdd() {
    return AspectRatio(
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
          child: Center(
            child: PopupMenuButton<String>(
              icon: Icon(Icons.more_horiz_sharp),
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
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
                    popDialog();
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
    );
  }

  void popDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.H,
          width: 300.W,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.H),
            ),
          ),
          child: AlertDialog(
            title: Text('新建文件夹'),
            content: Container(
              width: 220.W,
              height: 50.H,
              child: TextField(
                controller: model.controller,
                decoration: InputDecoration(
                  hintText: "请输入名称",
                  hintStyle: WjStyle.hintTextStyle,
                  counterText: "",
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                ),
                maxLength: 14,
                autocorrect: false,
                style: WjStyle.inputTextStyle,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('确定'),
                onPressed: () {
                  model.createFolder(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool wantKeepAlive = true;
}
