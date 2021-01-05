import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() {
  runZoned(() {
    runApp(App());
    // 判断当前设备是否为安卓
    if (Platform.isAndroid) {
      // 这一步设置状态栏颜色为透明
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }, onError: (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}
