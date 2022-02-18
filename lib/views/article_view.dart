import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  const ArticleView({required this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Opacity(
              opacity: 0,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Icon(Icons.save)),
            )
          ],
          foregroundColor: Colors.black,
          elevation: 0.0,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("Flutter",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
                Text("News",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600))
              ]),
          backgroundColor: Colors.transparent),
      body: WebView(
        initialUrl: widget.blogUrl,
        onWebViewCreated: ((WebViewController webViewController) {
          _completer.complete(webViewController);
        }),
      ),
    );
  }
}
