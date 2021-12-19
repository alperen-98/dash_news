import 'package:dash_news/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:dash_news/providers/article_provider.dart';
import 'package:provider/provider.dart';

class CountryPopupMenu extends StatelessWidget {
  final List<PopupMenuItem> countryCategories = List.generate(
    countries.length,
    (index) => PopupMenuItem(
      child: Text(
        countries[index]['country']!,
      ),
      value: countries[index]['code'].toString(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final article = context.read<ArticleProvider>();
    return PopupMenuButton(
      tooltip: 'Countries',
      icon: const Icon(Icons.language),
      onSelected: (value) {
        article.setCountry(value.toString());
      },
      itemBuilder: (ctx) => countryCategories,
    );
  }
}
