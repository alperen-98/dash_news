import 'package:dash_news/providers/article_provider.dart';
import 'package:dash_news/screens/articles_by_category_screen.dart';
import 'package:dash_news/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryNames.length,
        itemBuilder: (context, i) => CategoryButton(title: categoryNames[i]),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final category = title.toLowerCase();
        context.read<ArticleProvider>().setCategory(category);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticlesByCategoryScreen(
              category: title,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        decoration: const BoxDecoration(
          color: CupertinoColors.activeGreen,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
