import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlWidget extends StatefulWidget {
  final String title;
  final String htmlData;

  HtmlWidget({
    @required this.htmlData,
    @required this.title,
  }) : assert(htmlData != null);

  @override
  _HtmlWidgetState createState() => _HtmlWidgetState();
}

class _HtmlWidgetState extends State<HtmlWidget> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'data:text/html;base64,${base64Encode(const Utf8Encoder().convert(widget.htmlData))}',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (isLoading)
            Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                padding: EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinKitDoubleBounce(color: Theme.of(context).primaryColor),
                    Container(width: 10.0),
                    Container(
                      child: Text("加载中"),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
