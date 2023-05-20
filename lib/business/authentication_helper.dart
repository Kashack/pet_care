import 'package:supabase_flutter/supabase_flutter.dart';

class Authentication{
  final supabase = Supabase.instance.client;

  createAnAccount() async {
    final AuthResponse res = await supabase.auth.signUp(
      email: 'example@email.com',
      password: 'example-password',
    );
    final Session? session = res.session;
    final User? user = res.user;
  }
}