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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorName.primaryColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
