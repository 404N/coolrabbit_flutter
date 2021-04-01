import 'package:flutter/material.dart';
import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';
import 'package:white_jotter_app/model/folder_entity.dart';
import 'package:white_jotter_app/utils/dio/address.dart';
import 'package:white_jotter_app/utils/dio/dio_util.dart';

class LoginApis {
  Future<List<FolderEntity>> getAllFolder(String email, String password) async {
    await DioUtil.request<List<FolderEntity>>(
      Address.login(email, password),
      RequestMethod.POST,
      data: {
        "email": email,
        "password": password,
      },
      tips: true,
      showLoading: true,
      onSuccess: (data){
        return data;
      }
    );
  }


}