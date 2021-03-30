import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:sp_util/sp_util.dart';
import 'package:white_jotter_app/viewmodel/service_locator.dart';

import 'app.dart';

void main() async {
  runZoned(() {
    // DoKit.runApp(
    //   app: DoKitApp(App()),
    //   useInRelease: false,
    // );
    setupServiceLocator();
    WidgetsFlutterBinding.ensureInitialized();
    SpUtil.getInstance();
    runApp(
      ScreenUtilInit(
        designSize: Size(360, 690),
        allowFontScaling: false,
        builder: () => App(),
      ),
    );
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
