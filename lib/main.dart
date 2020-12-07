import 'package:flutter/material.dart';
import 'package:fresh_news/pages/newsListPage.dart';
import 'package:fresh_news/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Fresh News",
        home: ChangeNotifierProvider(
          create: (context) => NewsArticleListViewModel(),
          child: NewsListPage(),
        ));
  }
}
