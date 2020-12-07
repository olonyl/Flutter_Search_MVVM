import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_news/pages/newsArticleDetailPage.dart';
import 'package:fresh_news/viewmodels/newsArticleListViewModel.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';
import 'package:fresh_news/widgets/newsList.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsListPageState();
  }
}

void _showNewArticleDetail(BuildContext context, NewsArticleViewModel article) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NewsArticleDetailPage(article: article),
    ),
  );
}

Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
  switch (vm.loadingStatus) {
    case LoadingStatus.searching:
      return Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    case LoadingStatus.empty:
      return Align(
        alignment: Alignment.center,
        child: Text("No result found"),
      );
    case LoadingStatus.completed:
      return Expanded(
        child: NewsList(
          articles: vm.articles,
          onSelected: (article) => _showNewArticleDetail(context, article),
        ),
      );
  }
  return Text("No result found");
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Top News",
          ),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) vm.search(value);
              },
              controller: _controller,
              decoration: InputDecoration(
                  labelText: "Enter search term",
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                    ),
                    onPressed: () {
                      Future.delayed(Duration(milliseconds: 50)).then((_) {
                        _controller.clear();
                        FocusScope.of(context).unfocus();
                      });
                    },
                  )),
            ),
            _buildList(context, vm)
          ],
        ));
  }
}
