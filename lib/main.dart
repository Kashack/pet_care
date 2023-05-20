import 'package:flutter/material.dart';
import 'package:pet_care/presentation/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/constant/database_key.dart';
import 'presentation/constant/my_colors.dart';
import 'presentation/onboarding/welcome_page.dart';

bool? initScreen = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences? prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getBool('isFirstTime');
  await prefs.setBool('isFirstTime', false);
  await Supabase.initialize(
    url: databaseUrl,
    anonKey: databaseAnonKey,
  );
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
      home:  initScreen == true || initScreen == null
          ? WelcomeScreen()
          : RegistrationPage(),
    );
  }
}
