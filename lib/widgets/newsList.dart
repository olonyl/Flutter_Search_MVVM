import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel) onSelected;

  const NewsList({Key key, this.articles, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          var article = articles[index];
          return ListTile(
            onTap: () {
              this.onSelected(article);
            },
            leading: Container(
              width: 100,
              height: 100,
              child: article.imageURL == null
                  ? Image.asset("images/news-placeholder.jpg")
                  : Image.network(article.imageURL),
            ),
            title: Text(article.title),
          );
        },
      ),
    );
  }
}
