import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srh360app/core/constant/theme/app_theme.dart';
import 'package:srh360app/modules/quiz/widgets/quiz_custom_background.dart';

class UploadQuestionsView extends StatefulWidget {
  const UploadQuestionsView({super.key});

  @override
  State<UploadQuestionsView> createState() => _UploadQuestionsViewState();
}

class _UploadQuestionsViewState extends State<UploadQuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomBackground(
            child: Column(
          children: [
            Title(
                color: Colors.black,
                child: Text(
                  "Upload your document",
                  style: TextStyle(fontSize: 20),
                )),
          ],
        )),
      ),
    );
  }
}
