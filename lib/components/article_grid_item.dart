import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_news/screens/article_web_view.dart';
import 'package:dash_news/widgets/error_widget.dart';
import 'package:dash_news/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleGridItem extends StatelessWidget {
  const ArticleGridItem({
    required this.url,
    required this.imageUrl,
    required this.title,
  });
  final String url;
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleWebView(
              link: url,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => LoadingIndicator(),
                errorWidget: (context, url, error) => ArticleErrorIcon(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
