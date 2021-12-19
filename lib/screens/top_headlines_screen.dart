import 'package:dash_news/components/articles_grid_view.dart';
import 'package:dash_news/providers/article_provider.dart';
import 'package:dash_news/widgets/category_button.dart';
import 'package:dash_news/widgets/country_popup_menu.dart';
import 'package:dash_news/widgets/error_widget.dart';
import 'package:dash_news/widgets/heading.dart';
import 'package:dash_news/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopHeadlinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dash News'),
        actions: [
          CountryPopupMenu(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: context.read<ArticleProvider>().getTopHeadlines,
        child: SafeArea(
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const Heading(title: 'Categories'),
                    Categories(),
                    const SizedBox(height: 20),
                    Consumer<ArticleProvider>(
                      builder: (ctx, provider, _) {
                        final state = provider.thState;
                        if (state == TopHeadlinesState.OK) {
                          return ArticlesGridView(
                              articles: provider.topHeadlines);
                        } else if (state == TopHeadlinesState.LOADING) {
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
