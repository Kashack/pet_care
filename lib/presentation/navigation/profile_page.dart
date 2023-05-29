import 'package:flutter/material.dart';
import 'package:pet_care/presentation/authentication/registration_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatelessWidget {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    // print(supabase.auth.currentSession!.user.email);
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Sign Out'),
          onPressed: () async {
            await supabase.auth.signOut().then((value){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationPage(),
                  ),
                  ModalRoute.withName('/'));
            });
          },
        ),
      ),
    );
  }
}
