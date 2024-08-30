import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srh360app/model/course.dart';
import 'package:srh360app/presentation/pages/lesson_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;
  const CourseDetailScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 30.0, bottom: 30.0),
                child: Divider(),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 30.0, bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            course.name,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${course.lessons.length} lessons',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              '${course.progress} Done',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                                size: 12,
                                selectedColor: Colors.grey,
                                unselectedColor: Colors.grey[300]!,
                                //roundedEdges: Radius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                        width: 180,
                        height: 180,
                        child: Image.network(course.imageUrl)),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 30.0, bottom: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        course.description,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: course.lessons.length,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(LessonPage(
                  lesson: course.lessons[index],
                ));
              },
              child: Container(
                //  width: listOfLessons[index].length <= 3 ? 100 : null,

                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(35),
                //     color: Color.fromARGB(255, 243, 74, 119)),
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: [
                        SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset(
                          'assets/images/checkmark.svg',
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          course.lessons[index].name,
                          style: TextStyle(fontSize: 20),
                        ),

                        // SizedBox(
                        //   width: 14,
                        // ),
                      ]),
                    ),
                    SizedBox(
                        child: index != course.lessons.length - 1
                            ? Divider()
                            : SizedBox())
                  ],
                ),
              ),
            );
          },
        )
      ])),
    );
  }
}
