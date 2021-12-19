import 'package:dash_news/components/articles_grid_view.dart';
import 'package:dash_news/providers/article_provider.dart';
import 'package:dash_news/widgets/country_popup_menu.dart';
import 'package:dash_news/widgets/error_widget.dart';
import 'package:dash_news/widgets/heading.dart';
import 'package:dash_news/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticlesByCategoryScreen extends StatelessWidget {
  const ArticlesByCategoryScreen({required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dash News'),
        actions: [
          CountryPopupMenu(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final provider = context.read<ArticleProvider>();
          provider.getArticlesByCategory(provider.selectedCategory);
        },
        child: SafeArea(
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Heading(title: category),
                    Consumer<ArticleProvider>(
                      builder: (ctx, provider, _) {
                        final state = provider.chState;
                        if (state == CategoryHeadlinesState.OK) {
                          return ArticlesGridView(
                              articles: provider.categoryHeadlines);
                        } else if (state == CategoryHeadlinesState.LOADING) {
                          return LoadingIndicator();
                        } else {
                          return ArticleErrorIcon();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
