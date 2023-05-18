import 'package:flutter/material.dart';

import 'component/my_text_field.dart';

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
                                      icon: const Icon(Icons.visibility_off_outlined),
                                      onPressed: () {
                                        setState(() => isObsecure = !isObsecure);
                                      },
                                    )
                                  : IconButton(
                                      icon: const Icon(Icons.visibility_outlined),
                                      onPressed: () {
                                        setState(() => isObsecure = !isObsecure);
                                      },
                                    ),
                              onchanged: (value) => passwordText,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text('Do not remember the password?'),
                              ),
                            ),
                            FilledButton(
                              onPressed: () {},
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
                      Expanded(child: Container(height: 2,color: Color(0xFFF0F0F8),)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('or continue with'),
                      ),
                      Expanded(child: Container(height: 2,color: Color(0xFFF0F0F8),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: IconButton(onPressed: () {

                        }, icon: Icon(Icons.facebook,color: Colors.lightBlue,size: 100,)),
                      ),
                      Expanded(
                        child: IconButton(onPressed: () {

                        }, icon: Icon(Icons.facebook,color: Colors.lightBlue,size: 100)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

