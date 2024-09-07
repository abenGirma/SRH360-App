import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:srh360app/gen/assets.gen.dart';
import 'package:srh360app/model/user_model.dart';
import 'package:srh360app/services/auth_service.dart';

import '../widgets/course_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final searchController = TextEditingController();
  final AuthService _authService = AuthService();
  UserModel? user;
 @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final fetchedUser = await _authService.getCurrentUserInfo();
    setState(() {
      user = fetchedUser;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hi, ${user?.name ?? 'User'}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Assets.images.placeHolder.image(
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  Icons.keyboard_voice_outlined,
                  size: 25,
                  color: Colors.grey,
                )),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Courses',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CourseCard(
                          title: 'Family Planning',
                          color: Colors.orangeAccent.withOpacity(0.5),
                          imagePath: Assets.images.familyPlanningPng.path,
                          lesson: 10,
                          percentFinished: 10,
                        ),
                        CourseCard(
                          title: 'HIV & STI',
                          color: Colors.orangeAccent.withOpacity(0.5),
                          imagePath: Assets.images.hIVLogo.path,
                          lesson: 15,
                          percentFinished: 10,
                        ),
                        CourseCard(
                          title: 'Adolescence',
                          color: Colors.orangeAccent.withOpacity(0.5),
                          imagePath: Assets.images.adolescence.path,
                          lesson: 10,
                          percentFinished: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Articles',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  _buildArticleTile(),
                  _buildArticleTile(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildArticleTile() {
    return GestureDetector(
      onTap: () {
    //  
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Assets.images.familyPlanningJpeg.image(
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: 50.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Important of Prenatal Care',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 7),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Dani Martinez | 5 min read',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
