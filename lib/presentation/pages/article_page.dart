import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/article_controller.dart';
import '../../model/article.dart';
import '../widgets/article_card.dart';
import '../widgets/article_text.dart';
import '../widgets/category_text.dart';
import 'article_detail_page.dart';

class ArticlesPage extends StatelessWidget {
  final ArticlesController controller = Get.put(ArticlesController());
  final Profile profilePic;

  ArticlesPage({super.key, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Custom Back Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 10),
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Image.asset(
                            'assets/img/back.png',
                            scale: 3,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      // Profile Picture
                      Padding(
                        padding: const EdgeInsets.only(top: 50, right: 10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(profilePic.imagegUrl),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Discover Text
                  const Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 10),
                    child: Text(
                      'Discover',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  // Search Field
                  TextField(
                    onChanged: (query) {
                      controller.searchArticles(query);
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.mic),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Categories
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryText(
                            'Featured',
                            context,
                            controller.selectedCategory.value,
                            controller.setCategory),
                        CategoryText(
                            'Family Planning',
                            context,
                            controller.selectedCategory.value,
                            controller.setCategory),
                        CategoryText(
                            'Infections',
                            context,
                            controller.selectedCategory.value,
                            controller.setCategory),
                        CategoryText(
                            'Adolescent',
                            context,
                            controller.selectedCategory.value,
                            controller.setCategory),
                      ],
                    );
                  }),
                  const SizedBox(height: 16),
                  // Articles
                  Obx(() {
                    return Column(
                      children: controller
                          .getArticlesForCategory(
                              controller.selectedCategory.value)
                          .map((article) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () => Get.to(() => ArticleDetail(
                                            article: article,
                                            selectedCategory: controller
                                                .selectedCategory.value,
                                          )),
                                      child: ArticleCard(article)),
                                  ArticleText(article),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 15,
                                        bottom: 15),
                                    child: Divider(),
                                  ),
                                ],
                              ))
                          .toList(),
                    );
                  }),
                ],
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 243, 204, 224),
              Color.fromARGB(255, 238, 121, 160)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 109, 109, 109),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
                size: 30,
              ),
              label: 'Apps',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: 30,
              ),
              label: 'Menu',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
          
          },
        ),
      ),
    );
  }
}
