import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(backgroundColor: Colors.cyan,),
            SizedBox(
              height: 20,
            ),
            Text("Loading..."),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ],
    );
  }
}
