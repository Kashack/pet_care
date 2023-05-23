import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_care/presentation/sign_in_page.dart';
import 'package:pet_care/presentation/sign_up_with_email.dart';

import 'constant/my_colors.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, stops: [
          0.2,
          0.8
        ], colors: [
          Color(0xFF4596EA),
          Color(0xFF4552CB),
        ])),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                    ),
                    children: [
                      TextSpan(
                          text: 'Pet Care',
                          style: TextStyle(color: Color(0xFFFFCF6F)))
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.squareFacebook,
                  color: MyColors.violet,
                ),
                label: RichText(
                  text: const TextSpan(
                    text: 'Continue with ',
                    style: TextStyle(color: MyColors.violet, fontSize: 16),
                    children: [
                      TextSpan(
                          text: 'Facebook',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.google,
                    color: MyColors.violet),
                label: RichText(
                  text: const TextSpan(
                    text: 'Continue with ',
                    style: TextStyle(color: MyColors.violet, fontSize: 16),
                    children: [
                      TextSpan(
                          text: 'Google',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpWithEmailPage(),
                      ));
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30))),
                child: RichText(
                  text: const TextSpan(
                    text: 'Register with ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    children: [
                      TextSpan(
                          text: 'Email',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    },
                    child: const Text('Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
