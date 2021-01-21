import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:white_jotter_app/entity/note_entity.dart';
import 'package:white_jotter_app/page/note_detail/note_detail_page.dart';
import 'package:white_jotter_app/utils/widget_extention_util.dart';

import 'markdown_widget.dart';

class NoteWidget extends StatelessWidget {
  final NoteContent content;

  const NoteWidget(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.only(top: 0, right: 15, left: 15, bottom: 15),
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
              CachedNetworkImage(
                height: 70,
                width: 70,
                imageUrl: content.articleCover,
                placeholder: (context, url) => Icon(Icons.stream),
                errorWidget: (context, url, error) =>
                    Icon(Icons.cloud_download),
                fit: BoxFit.cover,
              ),
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
                          content.articleTitle,
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
                          content.articleAbstract,
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
    ).gestureDetectorExtension(
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoteDetailPage(
            title: content.articleTitle,
            content: content.articleContentMd,
          ),
        ),
      ),
    );
  }
}
