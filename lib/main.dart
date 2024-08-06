import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srh360app/presentation/auth/auth.dart';
import 'package:srh360app/presentation/pages/home_page.dart';
import 'package:srh360app/presentation/pages/sign_up_page.dart';

import 'config/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('am'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SRH360',
        theme: lightThemeData(),
        home: const AuthPage(),
      ),
    );
  }
}
