import 'package:dash_news/models/article.dart';
import 'package:flutter/material.dart';
import 'article_grid_item.dart';

class ArticlesGridView extends StatelessWidget {
  const ArticlesGridView({required this.articles});
  final List<Article> articles;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, i) {
        final article = articles[i];
        return ArticleGridItem(
          url: article.url,
          imageUrl: article.urlToImage,
          title: article.title,
        );
      },
    );
  }
}
