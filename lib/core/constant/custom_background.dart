import 'package:flutter/cupertino.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: child,
    );
  }
}
