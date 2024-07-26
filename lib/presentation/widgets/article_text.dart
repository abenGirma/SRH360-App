// views/article_text.dart
import 'package:flutter/material.dart';

import '../model/article.dart';

class ArticleText extends StatelessWidget {
  final Article article;

  const ArticleText(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              article.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            article.description,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
