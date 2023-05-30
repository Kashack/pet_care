import 'package:flutter/material.dart';
import 'package:pet_care/presentation/authentication/email_verification_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../presentation/navigation/nav_page.dart';

class Authentication {
  final supabase = Supabase.instance.client;
  BuildContext context;

  Authentication(this.context);

  Future createAnAccount({
    required String email,
    required String password,
    required String name,
    required bool newsletter,
  }) async {
    try {
      await supabase.auth
          .signUp(
        email: email,
        password: password,
      )
          .then((value) async {
        await supabase.from('userInfo').insert({
          'id': value.user!.id,
          'first_name': spiltName(name)[0],
          'last_name': spiltName(name)[1],
          'email': email,
          'newsletter': newsletter
        }).then((value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => VerificationPage(
                  email: email,
                ),
              ),
              ModalRoute.withName('/'));
        });
      });
      // final Session? session = res.session;
      // final User? user = res.user;
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
    return false;
  }

  Future signIn({required String email, required String password}) async {
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
    } on AuthException catch (e) {
      if (e.message == 'Email not confirmed') {
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationPage(email: email),
          ),
        );
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  List spiltName(String name) {
    List names = [];
    RegExp exp = RegExp('[a-zA-Z\s]+');
    Iterable<RegExpMatch> matches = exp.allMatches(name);
    for (final m in matches) {
      names.add(m[0]);
    }
    return names;
  }
}
