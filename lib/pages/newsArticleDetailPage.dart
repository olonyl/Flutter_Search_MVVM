import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailPage extends StatelessWidget {
  final NewsArticleViewModel article;
  const NewsArticleDetailPage({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.article.title}"),
      ),
      body: WebView(
        initialUrl: this.article.url,
      ),
    );
  }
}
