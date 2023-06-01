import 'package:flutter/material.dart';
import 'package:pet_care/presentation/navigation/home_page.dart';
import 'package:pet_care/presentation/navigation/nav_page.dart';
import 'package:pet_care/presentation/authentication/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'business/constant/database_key.dart';
import 'business/constant/my_colors.dart';
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
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final supabase = Supabase.instance.client;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: MyColors.violet
        )
      ),
      home:  initScreen == true || initScreen == null
          ? const WelcomeScreen()
          : supabase.auth.currentUser == null ? const RegistrationPage() : const NavPage(),
    );
  }

  checkIfLogin() async {
    supabase.auth.currentUser!.id ;
    // await supabase.auth.onAuthStateChange.listen((data) {
    //   final AuthChangeEvent event = data.event;
    //   final Session? session = data.session;
    //   if (event == AuthChangeEvent.signedIn) {
    //     return NavPage();
    //     // handle signIn
    //   }
    // });
  }
}
