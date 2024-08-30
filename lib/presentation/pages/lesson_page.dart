import 'package:flutter/material.dart';
import 'package:srh360app/model/lesson.dart';

class LessonPage extends StatelessWidget {
  final Lesson lesson;
  const LessonPage({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(lesson.name),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 30.0, bottom: 10.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  lesson.headerImage.isNotEmpty
                      ? SizedBox(
                          height: 300,
                          child: Image.network(
                            lesson.headerImage,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(Icons.broken_image,
                                    size: 50, color: Colors.grey),
                              );
                            },
                          ),
                        )
                      : Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    lesson.title,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    lesson.body,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
