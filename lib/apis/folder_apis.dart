import 'package:flutter/material.dart';
import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';
import 'package:white_jotter_app/model/folder_entity.dart';
import 'package:white_jotter_app/utils/dio/address.dart';
import 'package:white_jotter_app/utils/dio/dio_util.dart';

class FolderApis {
  Future<void> getAllFolder({Function onSuccess}) async {
    await DioUtil.request<List<FolderEntity>>(
      Address.getAllFolder(),
      RequestMethod.GET,
      onSuccess: (data){
        onSuccess(data);
      }
    );
  }
}