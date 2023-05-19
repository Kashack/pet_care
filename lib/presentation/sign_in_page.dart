import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_care/presentation/navigation/home_page.dart';
import 'package:pet_care/presentation/navigation/nav_page.dart';
import 'package:pet_care/presentation/registration_page.dart';

import 'component/my_text_field.dart';
import 'constant/my_colors.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isObsecure = true;

  String? emailText;

  String? passwordText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2 - 150,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, stops: [
                0.2,
                0.8
              ], colors: [
                Color(0xFF4596EA),
                Color(0xFF4552CB),
              ])),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: Form(
                        child: Column(
                          children: [
                            const myTextField(
                              label: 'Email',
                              textInputType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            myTextField(
                              label: 'Password',
                              textInputType: TextInputType.visiblePassword,
                              isObscureText: isObsecure,
                              trailingIcon: isObsecure
                                  ? IconButton(
                                      icon: const Icon(
                                          Icons.visibility_off_outlined),
                                      onPressed: () {
                                        setState(
                                            () => isObsecure = !isObsecure);
                                      },
                                    )
                                  : IconButton(
                                      icon:
                                          const Icon(Icons.visibility_outlined),
                                      onPressed: () {
                                        setState(
                                            () => isObsecure = !isObsecure);
                                      },
                                    ),
                              onchanged: (value) => passwordText,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child:
                                    const Text('Do not remember the password?'),
                              ),
                            ),
                            FilledButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavPage(),
                                  ),
                                );
                              },
                              child: const Text('Sign In'),
                              style: FilledButton.styleFrom(
                                  fixedSize: Size.fromWidth(
                                      MediaQuery.of(context).size.width)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Container(
                        height: 2,
                        color: const Color(0xFFF0F0F8),
                      )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('or continue with'),
                      ),
                      Expanded(
                          child: Container(
                        height: 2,
                        color: const Color(0xFFF0F0F8),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFF3D5C98),
                        child: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        color: const Color(0xFFEF403B),
                        // radius: 30,
                        child: IconButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have account yet? ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationPage(),
                              ),
                              (route) => false);
                        },
                        child: const Text('Registration',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.violet,
                              fontSize: 16,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
