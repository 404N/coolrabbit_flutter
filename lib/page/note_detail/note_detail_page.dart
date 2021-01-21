import 'package:flutter/material.dart';

import '../../utils/style/white_jotter_style.dart';
import '../../widget/markdown_widget.dart';

class NoteDetailPage extends StatelessWidget {
  final String title;
  final String content;

  const NoteDetailPage({Key key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: WjStyle.appBarStyle,
        ),
        backgroundColor: WJColors.color_F5F6F7,
        centerTitle: true,
        elevation: 0,
      ),
      body: MarkDownWidget(
        mdData: content,
      ),
    );
  }
}
