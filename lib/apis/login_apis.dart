import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';
import 'package:white_jotter_app/model/user_entity.dart';
import 'package:white_jotter_app/utils/dio/address.dart';
import 'package:white_jotter_app/utils/dio/dio_util.dart';
import 'package:dio/dio.dart';

class LoginApis {
  Future<void> login({String email, String password,Function onSuccess}) async {
    await DioUtil.request<UserEntity>(
      Address.login(email, password),
      RequestMethod.POST,
      data: {
        "email": email,
        "password": password,
      },
      tips: true,
      showLoading: true,
      onSuccess: (value) {
        onSuccess(value);
      },
      onError: (code, msg) {
      },
    );
  }

  Future<bool> register(String email, String password) {
    return DioUtil.request(
      Address.register(email, password),
      RequestMethod.POST,
      tips: true,
      showLoading: true,
    ).then((value) {
      return true;
    }).catchError((e) {
      return false;
    });
  }
}
