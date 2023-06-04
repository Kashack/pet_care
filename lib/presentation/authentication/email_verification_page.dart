import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_care/business/cubit/is_first_time_cubit.dart';
import 'package:pet_care/presentation/navigation/home_page.dart';
import 'package:pet_care/presentation/navigation/nav_page.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerificationPage extends StatefulWidget {
  final String email;

  const VerificationPage({super.key, required this.email});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  Timer? timer;
  bool canResendEmail = false;
  late final SupabaseClient supabase;

  @override
  void initState() {
    super.initState();
    supabase = Supabase.instance.client;
    sendVerificationEmail();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  sendVerificationEmail() async {
    await supabase.auth.signInWithOtp(email: widget.email,);
  }

  Future ConfirmVerificationEmail(String token) async {
    try {
      supabase.auth.verifyOTP(
        token: token,
        type: OtpType.signup,
        email: widget.email,
      ).then((value) => (value) async {
        SharedPreferences? prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isNewUser', true);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => NavPage(),
            ),
            ModalRoute.withName('/'));
      });
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 10));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      print('send: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.all(15),
                color: Color(0x74F9A84D),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0x74F9A84D)),
                ),
                icon: Icon(
                  CupertinoIcons.chevron_left,
                  color: Color(0xffDA6317),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Enter 6-digit\nVerification code',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Pinput(
                length: 6,
                onCompleted: (value) {
                  ConfirmVerificationEmail(value);
                },
              ),
              TextButton(
                  onPressed: () {
                     sendVerificationEmail();
                  },
                  child: Text('Resend Email'))
            ],
          ),
        ),
      ),
    );
  }
}
