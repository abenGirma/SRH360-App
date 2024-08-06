import 'package:flutter/material.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Introduction'),
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
                  top: 15.0, bottom: 15, left: 40, right: 40),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/8555891.jpg',
                    height: 300,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'What is family planning?',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consecteur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fames ac turpis egestas integer eget aliquet nibh praesent. Vivamus at augue eget arcu dictum varius duis at. Donec adipiscing tristique risus nec feugiat in fermentum posuere urna.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consecteur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fames ac turpis egestas integer eget aliquet nibh praesent. Vivamus at augue eget arcu dictum varius duis at. Donec adipiscing tristique risus nec feugiat in fermentum posuere urna.',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
