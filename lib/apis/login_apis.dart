import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';
import 'package:white_jotter_app/model/user_entity.dart';
import 'package:white_jotter_app/utils/dio/address.dart';
import 'package:white_jotter_app/utils/dio/dio_util.dart';

class LoginApis {
  Future<UserEntity> login(String email, String password) {
    return DioUtil.request(
      Address.login(email, password),
      RequestMethod.POST,
      tips: true,
      showLoading: true,
    ).then((value) {
      return JsonConvert.fromJsonAsT<UserEntity>(value.data.result);
    });
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
