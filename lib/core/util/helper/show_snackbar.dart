import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../gen/colors.gen.dart';


void showSnackbar(BuildContext context,
    {
    required String description,
   }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor:
    ColorName.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      content: SizedBox(
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  SizedBox(
                    width: 65.sw,
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  )
                ]),
          ],
        ),
      ),
    ),
  );
}