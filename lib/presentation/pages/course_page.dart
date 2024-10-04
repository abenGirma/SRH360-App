import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/controller/course_controller.dart';
import 'package:srh360app/gen/colors.gen.dart';
import 'package:srh360app/model/course_category.dart';
import 'package:srh360app/presentation/pages/course_detail_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  int selectedIndex = 0;
  final CourseController courseController = Get.put(CourseController());
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Courses',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w700),
                          ),
                          Text(
                              'Lorem ipsum dolor sit amet, amet tempor incididunt')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            child: ClipOval(
                                child: Image.asset(
                                    'assets/images/happy_face.png')),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                if (courseController.courseCategoreis.isEmpty) {
                  return Center(child: Text('No categories found.'));
                }

                final allCategory = CourseCategory(id: 'All', title: 'All');
                final categories = [
                  allCategory,
                  ...courseController.courseCategoreis
                ];

                return SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = categories[index];

                      return GestureDetector(
                        onTap: () {
                          courseController.fetchCoursesByCategory(category.id);
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: category.title == 'All'
                                ? BorderRadius.circular(20)
                                : BorderRadius.circular(30),
                            color: selectedIndex == index
                                ? ColorName.primaryColor
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              category.title,
                              style: TextStyle(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              Obx(
                () {
                  if (courseController.isLoading.value) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                        Center(child: CircularProgressIndicator()),
                      ],
                    );
                  }

                  if (courseController.courses.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                        Center(child: Text('No courses available')),
                      ],
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: ListView.builder(
                      itemCount: courseController.courses.length,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final course = courseController.courses[index];

                        return GestureDetector(
                          onTap: () {
                            Get.to(CourseDetailScreen(
                              course: course,
                            ));
                          },
                          child: Container(
                            height: 180,
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Colors.grey[200]),
                            child: Row(children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 130,
                                    width: 120,
                                    child: course.imageUrl.isNotEmpty
                                        ? Image.network(
                                            course.imageUrl,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Icon(Icons.broken_image,
                                                  size: 50, color: Colors.grey);
                                            },
                                          )
                                        : Icon(Icons.broken_image,
                                            size: 50, color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      course.lessons.length.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      course.description,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${course.progress}% Done',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          child: StepProgressIndicator(
                                            totalSteps: 1,
                                            currentStep: course.progress > 0
                                                ? course.progress ~/ 10
                                                : 0,
                                            size: 8,
                                            selectedColor: Colors.grey,
                                            unselectedColor: Colors.grey[300]!,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
