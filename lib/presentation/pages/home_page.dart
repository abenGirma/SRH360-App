import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/gen/colors.gen.dart';
import 'package:srh360app/model/course.dart';
import 'package:srh360app/model/lesson.dart';
import 'package:srh360app/presentation/pages/course_page.dart';
import 'package:srh360app/presentation/pages/sign_in_page.dart';
import 'package:srh360app/presentation/tabs/home_tab.dart';
import 'package:srh360app/presentation/tabs/menu_tab.dart';
import 'package:srh360app/presentation/tabs/profile_tab.dart';
import 'package:srh360app/services/auth_service.dart';

import '../../controller/course_controller.dart';

import '../../controller/course_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int tabIndex = 0;

  final AuthService _authService = AuthService();

  void logout() async{
    await _authService.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()));
    
  }

  void printUser() async {
    final user = await _authService.getCurrentUserInfo();
    print(user?.name);
    print(user?.role);
    print(user?.phoneNumber);
    
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//     final courseController = Get.put(CourseController());

// // // Create a new course object
//     Course newCourse = Course(
//       id: '', // Leave blank, Firestore will generate this
//       categoryID: '1rK2hFTqtyCjwsClKnCF',
//       name: 'Introduction to Reproductive Health',
//       description:
//           'A foundational course on reproductive health covering essential topics.',
//       progress: 0,
//       lessons: [], // Will be populated with lessons later
//       imageUrl: 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
//     );

// // Add the course to Firestore
//     courseController.addCourse(newCourse).then((_) {
//       // Add lessons after the course is successfully added
//       Lesson lesson1 = Lesson(
//           name: 'Reproductive health',
//           isCompleted: false,
//           headerImage:
//               'https://images.unsplash.com/photo-1499084732479-de2c02d45fc4',
//           title: 'Introduction',
//           body:
//               'Lorem ipsum dolor sit amet, consecteur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fames ac turpis egestas integer eget aliquet nibh praesent. Vivamus at augue eget arcu dictum varius duis at. Donec adipiscing tristique risus nec feugiat in fermentum posuere urna');

//       Lesson lesson2 = Lesson(
//           name: 'Family Planning',
//           isCompleted: false,
//           headerImage:
//               'https://images.unsplash.com/photo-1499084732479-de2c02d45fc4',
//           title: 'Reproductive Health',
//           body:
//               'Lorem ipsum dolor sit amet, consecteur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fames ac turpis egestas integer eget aliquet nibh praesent. Vivamus at augue eget arcu dictum varius duis at. Donec adipiscing tristique risus nec feugiat in fermentum posuere urna');

//       courseController.addLesson(newCourse.id, lesson1);
//       courseController.addLesson(newCourse.id, lesson2);
//     });

    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout)), IconButton(onPressed: printUser, icon: Icon(Icons.person))],
        ),
        body: Expanded(
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeTab(),
              CoursesScreen(),
              ProfileTab(),
              MenuTab(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorName.secondaryColor,
            ColorName.primaryColor,
            ColorName.primaryColor,
          ])),
          child: TabBar(
            controller: tabController,
            indicator: const BoxDecoration(),
            onTap: (value) {
              setState(() {
                tabIndex = value;
              });
            },
            tabs: [
              _buildTabButton(
                id: 0,
                icon: Icons.home,
              ),
              _buildTabButton(
                id: 1,
                icon: Icons.apps,
              ),
              _buildTabButton(
                id: 2,
                icon: Icons.person,
              ),
              _buildTabButton(
                id: 3,
                icon: Icons.menu,
              ),
            ],
          ),
        ));
  }

  _buildTabButton({required int id, required IconData icon}) {
    return Icon(
      icon,
      color: tabIndex == id ? Colors.white : Colors.white70,
      size: 30,
    );
  }
}