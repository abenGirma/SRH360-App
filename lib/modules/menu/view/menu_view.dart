import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/routes/app_pages.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD8CFFF),
              Color(0xFFEDF5FF),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Text(
                "Dashboard",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              _buildMenuButton(context, 'Create Questions', Icons.create,
                  Color.fromARGB(255, 169, 14, 66), () {
                print("Attempting to navigate to ${Routes.CREATEQUESTION}");
                try {
                  Get.toNamed(Routes.CREATEQUESTION);
                } catch (e) {
                  print("Navigation error: $e");
                }
              }),
              SizedBox(height: 20),
              _buildMenuButton(
                context,
                'Go to Exams',
                Icons.school,
                const Color.fromARGB(255, 24, 61, 125),
                () {
                  print("Attempting to navigate to ${Routes.CHOOSEEXAMCOURSE}");
                  try {
                    Get.toNamed(Routes.CHOOSEEXAMCOURSE);
                  } catch (e) {
                    print("Navigation error: $e");
                  }
                },
              ),
              SizedBox(height: 20),
              _buildMenuButton(
                context,
                'Add Excel doc',
                Icons.book,
                const Color.fromARGB(255, 34, 155, 96),
                () {
                  print("Attempting to navigate to ${Routes.UPLOADQUESTIONS}");
                  try {
                    Get.toNamed(Routes.UPLOADQUESTIONS);
                  } catch (e) {
                    print("Navigation error: $e");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.6),
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            blurRadius: 30,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavIcon(Icons.home, Colors.pinkAccent),
          _buildNavIcon(Icons.search, Colors.blueAccent),
          _buildNavIcon(Icons.settings, Colors.greenAccent),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }
}
