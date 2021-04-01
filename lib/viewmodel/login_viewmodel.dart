import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:white_jotter_app/apis/login_apis.dart';
import 'package:white_jotter_app/model/user_entity.dart';
import 'package:white_jotter_app/utils/common/storage_key.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  UserEntity userEntity;
  LoginApis _apis = LoginApis();

  Future<void> login(BuildContext context) async {
    await _apis.login(userName.text, password.text).then((value) {
      userEntity=value;
      SpUtil.putString(StorageKey.TOKEN, userEntity.token);
      Navigator.pop(context);
    });
  }
}
