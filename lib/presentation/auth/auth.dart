import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:srh360app/presentation/pages/home_page.dart';
import 'package:srh360app/presentation/pages/lesson_page.dart';
import 'package:srh360app/presentation/pages/quiz_intro_page.dart';
import 'package:srh360app/presentation/pages/sign_in_page.dart';
import 'package:srh360app/presentation/pages/welcome_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('User is signed in');
            return const HomePage();
          } else {
            print('User is not signed in');
            return const SignInPage();
          }
        },
      ),
    );
  }
}
