import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class MarkDownWidget extends StatelessWidget {
  final String mdData;

  const MarkDownWidget({Key key, this.mdData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Markdown(data: mdData),
      ),
    );
  }
}