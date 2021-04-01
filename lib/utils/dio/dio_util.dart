import 'dart:async';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sp_util/sp_util.dart';
import 'package:white_jotter_app/utils/common/storage_key.dart';

import 'address.dart';
import 'base_entity.dart';
import 'intercept.dart';

enum RequestMethod {
  POST,
  GET,
  PUT,
  DELETE,
}

class DioUtil {
// 请求实例
  static Dio instance;

  // static final baseUrl = "http://101.37.70.95:8080/";
  static final baseUrl = "http://localhost:8080/";

  // 初始化请求实例
  static void initInstance() {
    var options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
      responseType: ResponseType.plain,
      baseUrl: baseUrl,
      validateStatus: (status) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
    );
    DioUtil.instance = new Dio(options);
    (DioUtil.instance.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) {
        return true;
      };
    };
    DioUtil.instance.interceptors.add(LoggingInterceptor());

    /// 统一添加身份验证请求头
    DioUtil.instance.interceptors.add(
      InterceptorsWrapper(onRequest: (options) async {
        String accessToken = SpUtil.getString(StorageKey.TOKEN);
        if (accessToken.isNotEmpty) {
          options.headers["Authorization"] = "Bearer " + accessToken;
        }
        options.contentType = Headers.jsonContentType;
        options.responseType = ResponseType.json;
        return options;
      }, onResponse: (option) async {
        if (option.statusCode == HttpStatus.ok) {
          option.data = BaseEntity.fromJson(option.data);
        } else {
          option.data = BaseEntity(
            "500",
            "网络链接缓慢",
            null,
          );
        }
        return option;
      }),
    );
  }

  /// 请求
  static Future<Response<BaseEntity>> request(
    String url,
    RequestMethod method, {
    dynamic data,

    /// 参数
    Map<String, dynamic> queryParameters,

    /// 是否展示Loading
    bool showLoading = false,

    /// 错误时弹出提示
    bool errorTips = false,

    /// 正确或错误时都弹出提示
    bool tips = false,

    /// 正确时弹出提示
    bool successTips = false,
    bool useHost = true,
  }) {
    // 展示Loading
    if (showLoading) {
      EasyLoading.show(status: "");
    }
    Future<Response<BaseEntity>> response;
    switch (method) {
      case RequestMethod.GET:
        response = DioUtil.instance.get(
          url,
          queryParameters: queryParameters,
        );
        break;
      case RequestMethod.DELETE:
        response =
            DioUtil.instance.delete(url, queryParameters: queryParameters);
        break;
      case RequestMethod.PUT:
        response = DioUtil.instance.put(url, data: data);
        break;
      case RequestMethod.POST:
        response = DioUtil.instance.post(url, data: data);
        break;
    }
    Completer<Response<BaseEntity<dynamic>>> completer = Completer();
    response.then((value) {
      if (showLoading) {
        EasyLoading.dismiss();
      }
      if (value.data.code == "200") {
        // 请求成功
        if (successTips || tips) {
          Fluttertoast.showToast(
              msg: value.data.msg, gravity: ToastGravity.CENTER);
        }
        return value.data.data;
      } else {
        if (errorTips || tips) {
          Fluttertoast.showToast(
              msg: value.data.msg, gravity: ToastGravity.CENTER);
        }
      }
    }).catchError((e) {
      EasyLoading.dismiss();
      EasyLoading.showInfo("网络链接缓慢");
      completer.completeError(e);
    });
    return completer.future;
  }
}
