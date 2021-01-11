import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:white_jotter_app/entity/book_entity.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';

class BookWidget extends StatelessWidget {
  final BookEntity bookEntity;

  const BookWidget({Key key, this.bookEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            height: 70,
            imageUrl: bookEntity.cover,
            placeholder: (context, url) => Icon(Icons.stream),
            errorWidget: (context, url, error) => Icon(Icons.cloud_download),
            fit: BoxFit.cover,
          ),
          Text(
            bookEntity.title,
            style: WjStyle.bookTitleStyle,
          ),
          Text(
            bookEntity.author,
            style: WjStyle.bookAuthorStyle,
          ),
        ],
      ),
    );
  }
}
