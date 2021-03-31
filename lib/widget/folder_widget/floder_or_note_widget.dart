import 'package:flutter/material.dart';
import 'package:white_jotter_app/utils/common/ScreenUtils.dart';
import 'package:white_jotter_app/utils/style/Box.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';

class FolderOrNoteWidget extends StatelessWidget {
  final int type; //组件类型0为文件夹，1为笔记
  final String title;
  final String date;

  const FolderOrNoteWidget({Key key, this.type = 0, this.title, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.H),
      height: 60.H,
      decoration: BoxDecoration(
        color: WJColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.H),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Box.w15,
          Icon(
            Icons.folder,
            color: WJColors.color_306BFF,
            size: 20,
          ),
          Box.w10,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,style: WjStyle.folderTitleStyle,),
              Box.h5,
              Text(date,style: WjStyle.folderDataStyle,),
            ],
          ),
        ],
      ),
    );
  }
}
