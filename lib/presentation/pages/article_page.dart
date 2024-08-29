// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/model/article.dart';

import '../widgets/article_card.dart';
import '../../controller/article_controller.dart';
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
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Articles',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(profilePic.imagegUrl),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 10),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.mic),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
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
                                          selectedCategory:
                                              controller.selectedCategory.value,
                                        )),
                                    child: ArticleCard(article)),
                                ArticleText(article),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 15, bottom: 15),
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
        ),
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
              unselectedItemColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
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
              currentIndex:
                  0, // Replace with a variable to handle the current index
              onTap: (index) {
                // Handle navigation based on index
              },
            )));
  }
}
