import 'package:flutter/material.dart';
import 'package:white_jotter_app/entity/note_entity.dart';
import 'package:white_jotter_app/res.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';

class NoteWidget extends StatefulWidget {
  NoteContent content;
  NoteWidget(this.content);

  @override
  _NoteWidgetState createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.only(top: 0, right: 15, left: 15,bottom: 15),
      child: Card(
        //设置圆角
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Image(image: AssetImage(Res.wj_cat)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.content.articleTitle,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Icon(Icons.bookmarks_outlined),
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          widget.content.articleAbstract,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
