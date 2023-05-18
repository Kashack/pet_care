import 'package:flutter/material.dart';
import 'package:pet_care/presentation/sign_in_page.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
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
                text: TextSpan(
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
              SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.facebook),
                label: RichText(
                  text: TextSpan(
                    text: 'Continue with ',
                    style: TextStyle(color: Color(0xFF4552CB), fontSize: 16),
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
              SizedBox(
                height: 20,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.g_mobiledata),
                label: RichText(
                  text: TextSpan(
                    text: 'Continue with ',
                    style: TextStyle(color: Color(0xFF4552CB), fontSize: 16),
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
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    text: 'Continue with ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    children: [
                      TextSpan(
                          text: 'Google',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30))),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                              (route) => false);
                    },
                    child: Text('Sign In',
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
