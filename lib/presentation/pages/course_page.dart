import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/gen/colors.gen.dart';
import 'package:srh360app/presentation/pages/course_detail_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  int selectedIndex = 0;
  @override
  @override
  Widget build(BuildContext context) {
    List<String> listOfCategories = [
      'All',
      'Family Planning',
      'STI & HIV',
      'Adolescent',
      'Etc'
    ];
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
                                child:
                                    Image.asset('assets/image/happy_face.png')),
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  height: 40, // Set a fixed height for the ListView
                  child: ListView.builder(
                    itemCount: listOfCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          width:
                              listOfCategories[index].length <= 3 ? 100 : null,
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: selectedIndex == index
                                ? ColorName.primaryColor
                                // ? Color.fromARGB(255, 243, 74, 119)
                                : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            listOfCategories[index],
                            style: TextStyle(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black),
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: ListView.builder(
                  itemCount: listOfCategories.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   selectedIndex = index;
                        // });
                        Get.to(CourseDetailScreen());
                      },
                      child: Container(
                        height: 150,
                        width: listOfCategories[index].length <= 3 ? 100 : null,
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.grey[200]),
                        child: Row(children: [
                          Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 130,
                                  width: 120,
                                  child:
                                      Image.asset('assets/images/8555891.jpg'))
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
                                  'Family Planning',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '10 lessons',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet, amet tempor incididunt',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '10% Done',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      // padding: EdgeInsets.only(left: 3),
                                      color: Colors.grey,
                                      child: StepProgressIndicator(
                                        totalSteps: 2,
                                        currentStep: 1,
                                        size: 8,
                                        selectedColor: Colors.grey,
                                        unselectedColor: Colors.grey[300]!,
                                        //roundedEdges: Radius.circular(10),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
