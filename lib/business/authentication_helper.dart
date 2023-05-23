import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../presentation/navigation/nav_page.dart';

class Authentication {
  final supabase = Supabase.instance.client;
  BuildContext context;

  Authentication(this.context);

  createAnAccount(
      {required String email,
      required String password,
      required String name,
      required bool newsletter}) async {
    try {
      await supabase.auth
          .signUp(
        email: email,
        password: password,
      )
          .then((value) async {
        await supabase
            .from('customerInfo')
            .insert({'first_name': name, 'email': email});

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const NavPage(),
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
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email already in use')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
    return false;
  }

  signIn({required String email, required String password}) async {
    try {
      await supabase.auth
          .signInWithPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const NavPage(),
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
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email already in use')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }
}
