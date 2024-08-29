// views/article_detail.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/model/article.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;
  final String selectedCategory;

  const ArticleDetail({
    super.key,
    required this.article,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Image.asset(
                    'assets/img/back.png',
                    scale: 3,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Image.asset(
                      'assets/img/user.png',
                      scale: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${article.name} | ${article.minute.readingTime} min. read',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  article.articleName,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 15),
                child: Text(
                  article.bio,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    article.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                    children: _buildContentTextSpans(article.content),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  List<TextSpan> _buildContentTextSpans(String content) {
    return content
        .split('\n\n')
        .map((paragraph) => TextSpan(
              text: '$paragraph\n\n',
            ))
        .toList();
  }
}
