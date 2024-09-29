import 'package:flutter/material.dart';

class CreateQuestionButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Color? shadowColor;
  final FontWeight? fontWeight;

  const CreateQuestionButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    this.elevation,
    this.padding,
    this.shadowColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding ?? EdgeInsets.symmetric(vertical: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
        ),
        elevation: elevation ?? 10,
        backgroundColor: buttonColor ?? const Color(0xFF654EA3),
        shadowColor: shadowColor ?? Colors.black54,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: fontSize ?? 18,
          color: textColor ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.normal,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
