import 'package:flutter/material.dart';
import 'package:white_jotter_app/apis/folder_apis.dart';
import 'package:white_jotter_app/model/folder_entity.dart';

class FolderViewModel extends ChangeNotifier {
  String topString = "文件夹";
  bool isShowLeader = false;
  List<FolderEntity> folderList; //文件夹信息
  FolderApis _apis = FolderApis();

  Future<void> initData() async {
    await _apis.getAllFolder(
      onSuccess: (value) {
        folderList = value;
        notifyListeners();
      },
    );
  }
}
