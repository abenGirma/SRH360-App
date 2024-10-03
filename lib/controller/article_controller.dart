import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/article.dart';

class ArticlesController extends GetxController {
  var selectedCategory = 'Featured'.obs;
  var articles = <Article>[].obs;
  var filteredArticles = <Article>[].obs;
  var isLoading = true.obs; 

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }
  
  
  void fetchArticles() async {
    try {
      isLoading.value = true; 
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      String category = selectedCategory.value;

      QuerySnapshot snapshot = await firestore
          .collection('articles')
          .doc(category)
          .collection('items')
          .get();

      var fetchedArticles = snapshot.docs.map((doc) {
        return Article(
          category: category,
          title: doc['title'],
          imageUrl: doc['imageUrl'],
          description: doc['description'],
          minute: doc['minute'],
          content: doc['content'],
          name: doc['name'],
          bio: doc['bio'],
          articleName: doc['articleName'],
        );
      }).toList();
     

      articles.assignAll(fetchedArticles);
      filteredArticles.assignAll(fetchedArticles);
    } catch (e) {
      Get.snackbar('Error', 'Error fetching articles');
    } finally {
      isLoading.value = false;
    }
  }
  

  void setCategory(String category) {
    selectedCategory.value = category;
    fetchArticles();
  }

  void searchArticles(String query) {
    if (query.isEmpty) {
      filteredArticles.assignAll(articles);
    } else {
      var results = articles.where((article) {
        return article.title.toLowerCase().contains(query.toLowerCase()) ||
            article.content.toLowerCase().contains(query.toLowerCase());
      }).toList();

      filteredArticles.assignAll(results);
    }
  }

  List<Article> getArticlesForCategory(String category) {
    return filteredArticles;
  }
}
