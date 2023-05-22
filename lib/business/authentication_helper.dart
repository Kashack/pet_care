import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../presentation/navigation/home_page.dart';

class Authentication {
  final supabase = Supabase.instance.client;
  BuildContext context;

  Authentication(this.context);

  createAnAccount(String email, String password) async {
    try {
      await supabase.auth
          .signUp(
        email: email,
        password: password,
      )
          .then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            ModalRoute.withName('/'));
      });
      // final Session? session = res.session;
      // final User? user = res.user;
    } on AuthException catch (e) {
      if (e.message == "network-request-failed") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Network error')));
      } else if (e.message == "email-already-in-use") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Email already in use')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
    return false;
  }
}
