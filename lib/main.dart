import 'package:flutter/material.dart';
import 'package:pet_care/presentation/sign_in_page.dart';

import 'presentation/onboarding/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color(0xFF4552CB)
        )
      ),
      home: SignInPage(),
    );
  }
}
