import 'package:get/get.dart';

import '../model/article.dart';

class ArticlesController extends GetxController {
  var selectedCategory = 'Featured'.obs;
  var articles = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  void fetchArticles() {
    // Simulate fetching articles from a data source
    var fetchedArticles = [
      Article(
        category: 'Featured',
        title: 'Importance of Parental Care',
        imageUrl:
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTWBAfSyMYeudVuTTpBn1_G_3Quas42FM0wO4N4z9Ro4R9_6jVX',
        description:
            'Read a selection of opinion pieces from world-class journalists.',
        minute: Minute(readingTime: 5),
        content:
            'Writing effectively is an art. Start by using simple, everyday words people can easily understand. Be clear and direct to the point. Keep your thoughts flowing logically, and aim for brevity unless you’re writing in the long form.\n\nYour ideas have a purpose so choose words that accurately express them. Ensure your grammar is flawless as it impacts your credibility. Use the active voice whenever possible as it makes any narrative easier to read.',
        name: 'Dani Martinez',
        bio: 'Read a selection of opinion pieces from world-class journalists.',
        articleName: 'The Ultimate Guide to Writing',
      ),
      Article(
        category: 'Featured',
        title: 'The Impact of Early Education',
        imageUrl:
            'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQP-8v7jMDpbGgNWGNoIViSQwYi92qHA6UpvQEm3yoSRpqfPu5z',
        description:
            'Read a selection of opinion pieces from world-class journalists.',
        minute: Minute(readingTime: 4),
        content:
            'Writing effectively is an art. Start by using simple, everyday words people can easily understand. Be clear and direct to the point. Keep your thoughts flowing logically, and aim for brevity unless you’re writing in the long form.\n\nYour ideas have a purpose so choose words that accurately express them. Ensure your grammar is flawless as it impacts your credibility. Use the active voice whenever possible as it makes any narrative easier to read.',
        name: 'Dani Martinez',
        bio: 'Read a selection of opinion pieces from world-class journalists.',
        articleName: 'The Ultimate Guide to Writing',
      ),
      Article(
        category: 'Family Planning',
        title: 'Family Planning Article',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrzb660-2jGK-mZUU4cqyByL_UgxjsrRMaPY3jYVKE20DCL2Az',
        description:
            'Read a selection of opinion pieces from world-class journalists.',
        minute: Minute(readingTime: 6),
        content:
            'Writing effectively is an art. Start by using simple, everyday words people can easily understand. Be clear and direct to the point. Keep your thoughts flowing logically, and aim for brevity unless you’re writing in the long form.\n\nYour ideas have a purpose so choose words that accurately express them. Ensure your grammar is flawless as it impacts your credibility. Use the active voice whenever possible as it makes any narrative easier to read.',
        name: 'Dani Martinez',
        bio: 'Read a selection of opinion pieces from world-class journalists.',
        articleName: 'The Ultimate Guide to Writing',
      ),
      Article(
        category: 'Infections',
        title: 'Understanding Infections',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXwB2551fA2vtWBTz6OpgcYUJsguAuHJiecg&s',
        description:
            'Read a selection of opinion pieces from world-class journalists.',
        minute: Minute(readingTime: 7),
        content:
            'Writing effectively is an art. Start by using simple, everyday words people can easily understand. Be clear and direct to the point. Keep your thoughts flowing logically, and aim for brevity unless you’re writing in the long form.\n\nYour ideas have a purpose so choose words that accurately express them. Ensure your grammar is flawless as it impacts your credibility. Use the active voice whenever possible as it makes any narrative easier to read.',
        name: 'Dani Martinez',
        bio: 'Read a selection of opinion pieces from world-class journalists.',
        articleName: 'The Ultimate Guide to Writing',
      ),
      Article(
        category: 'Adolescent',
        title: 'Adolescent Health and Wellness',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5XSoTO_ex1DFqZ4jYzKKFJtkIjlrsgzNF0Q&s',
        description:
            'Read a selection of opinion pieces from world-class journalists.',
        minute: Minute(readingTime: 5),
        content:
            'Writing effectively is an art. Start by using simple, everyday words people can easily understand. Be clear and direct to the point. Keep your thoughts flowing logically, and aim for brevity unless you’re writing in the long form.\n\nYour ideas have a purpose so choose words that accurately express them. Ensure your grammar is flawless as it impacts your credibility. Use the active voice whenever possible as it makes any narrative easier to read.',
        name: 'Dani Martinez',
        bio: 'Read a selection of opinion pieces from world-class journalists.',
        articleName: 'The Ultimate Guide to Writing',
      ),
      // Add more articles here
    ];
    articles.assignAll(fetchedArticles);
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  List<Article> getArticlesForCategory(String category) {
    return articles.where((article) => article.category == category).toList();
  }
}
