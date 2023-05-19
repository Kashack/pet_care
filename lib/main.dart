import 'package:flutter/material.dart';

import 'presentation/constant/my_colors.dart';
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
          primary: MyColors.violet
        )
      ),
      home: WelcomeScreen(),
    );
  }
}
