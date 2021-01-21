import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension WidgetExtensionUtil on Widget {


  Widget paddingExtension(EdgeInsets padding) {
    return Padding(padding: padding, child: this);
  }

  Widget annotatedRegionExtension([SystemUiOverlayStyle value]) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: value ?? SystemUiOverlayStyle.dark,
      child: this,
    );
  }


  Widget sizeExtension({double width, double height, double size}) {
    return SizedBox(
      width: size ?? width,
      height: size ?? height,
      child: this,
    );
  }

  Widget clipOvalExtension() {
    return ClipOval(
      child: this,
    );
  }


  Widget gestureDetectorExtension(Function() onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: this,
    );
  }


  Widget safeAreaExtension() {
    return SafeArea(child: this);
  }

  Widget flexExtension([int flex = 1]) {
    return Expanded(
      child: this,
      flex: flex,
    );
  }

  Widget centerExtension() {
    return Center(
      child: this,
    );
  }

}


// extension SizeExtension on num {
//   num get W => ScreenUtil.getInstance().getWidth(this.toDouble());
//   num get H => ScreenUtil.getInstance().getHeight(this.toDouble());
//   num get Sp => ScreenUtil.getInstance().getSp(this.toDouble());
// }

extension OverText on Text {
  Text get Over {
    Text text=Text(this.data,style:this.style,textAlign:this.textAlign,overflow: TextOverflow.ellipsis,maxLines: this.maxLines,);
    return text;
  }
}


///防止重复调用
///防抖(debounce) 和 节流(throttle)
extension DebounceThrottlingE on Function {
  /// 防抖(debounce)
  /// 如果你function里面setstate了，会导致失效，因为funtion又是一个新的了
  VoidFunction debounce([Duration duration = const Duration(seconds: 1)]) {
    Timer _debounce;
    return () {
      // 还在时间之内，抛弃上一次
      // 执行最后一次
      if (_debounce?.isActive ?? false) {
        _debounce.cancel();
      }
      _debounce = Timer(duration, () {
        this.call();
      });
    };
  }

  /// 节流(throttle)
  /// 如果你function里面setstate了，会导致失效，因为funtion又是一个新的了
  VoidFunction throttle([Duration duration = const Duration(seconds: 1)]) {
    Timer _throttle;
    return () {
      // 执行第一次
      if (_throttle?.isActive ?? false) {
        return;
      }
      this.call();
      _throttle = Timer(duration, () {});
    };
  }
}

typedef VoidFunction = void Function();

