import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final Color color;
  final String title;
  final int lesson;
  final double percentFinished;
  final String imagePath;
  const CourseCard({
    super.key,
    required this.color,
    required this.title,
    required this.lesson,
    required this.percentFinished,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 10),
      padding: const EdgeInsets.all(10),
      width: 170,
      height: 250,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            '$lesson lessons',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 12,
                ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                imagePath,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${percentFinished.toInt()}% Done',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 10,
                    ),
              ),
              SizedBox(
                width: 90,
                child: Slider(
                  max: 100,
                  value: percentFinished,
                  onChanged: (value) {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
