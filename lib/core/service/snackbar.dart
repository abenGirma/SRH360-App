import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void popMessage(String message, {bool isSuccess = false}) {
    Get.snackbar(
      isSuccess ? 'Success' : 'Error', // Title
      message,
      backgroundColor: isSuccess ? Colors.green : Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(
        isSuccess ? Icons.check_circle : Icons.error,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
    );
  }
}
