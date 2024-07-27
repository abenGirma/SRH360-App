import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listOfLessons = [
      'Lesson 1',
      'Lesson 2',
      'Lesson 3',
      'Lesson 4',
      'Lesson 5'
    ];
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
                        Row(
                          children: [
                            Text(
                              'Family Planning',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '10 lessons',
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
                              '10% Done',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                  SizedBox(
                      height: 130,
                      width: 120,
                      child: Image.asset('assets/image/family_planning.jpeg')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 30.0, bottom: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, amet tempor incididunt',
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
          itemCount: listOfLessons.length,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // setState(() {
                //   selectedIndex = index;
                // });
                //  Get.to(CourseDetailScreen());
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
                          index == 0
                              ? 'Introduction'
                              : listOfLessons[index - 1],
                          style: TextStyle(fontSize: 20),
                        ),

                        // SizedBox(
                        //   width: 14,
                        // ),
                      ]),
                    ),
                    SizedBox(
                        child: index != listOfLessons.length - 1
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
