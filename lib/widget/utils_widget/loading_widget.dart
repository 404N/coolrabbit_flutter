import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:white_jotter_app/utils/style/Box.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';
import '../../res.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Box.h50,
            CircularProgressIndicator(backgroundColor: WJColors.primaryDarkValue,),
            Box.h15,
            Text("Loading..."),
            Box.h50,
          ],
        ),
      ],
    );
  }
}
