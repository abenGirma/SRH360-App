import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srh360app/gen/colors.gen.dart';

class CommonButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  const CommonButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.sw,
      height: 47,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorName.primaryColor.withOpacity(0.5),
              ColorName.primaryColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
