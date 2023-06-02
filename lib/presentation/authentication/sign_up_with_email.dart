import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_care/presentation/component/my_text_field.dart';
import 'package:pet_care/presentation/authentication/sign_in_page.dart';

import '../../business/database/authentication_helper.dart';
import '../../business/constant/my_colors.dart';

class SignUpWithEmailPage extends StatefulWidget {
  @override
  State<SignUpWithEmailPage> createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {
  final _formKey = GlobalKey<FormState>();
  bool isObsecure = true;
  bool _isLoading = false;
  String? fullNameText;
  String? emailText;
  String? passwordText;
  bool _isTermsChecked = false;
  bool _isNewsLetterChecked = false;
  late Authentication authentication;

  @override
  void initState() {
    super.initState();
    authentication = Authentication(context);
  }

  checkPassword(String password) {}

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
                    'Registration',
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
                        key: _formKey,
                        child: Column(
                          children: [
                            myTextField(
                              label: 'Full name',
                              textInputType: TextInputType.emailAddress,
                              onchanged: (value) => fullNameText = value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Fill this field';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            myTextField(
                              label: 'Email',
                              textInputType: TextInputType.emailAddress,
                              onchanged: (value) {
                                emailText = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid email';
                                }
                              },
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
                              onchanged: (value) => {passwordText = value},
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            CheckboxListTile(
                              title: RichText(
                                text: TextSpan(
                                    text: 'I agree with ',
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text: 'the terms and conditions',
                                          style: const TextStyle(
                                              color: MyColors.violet,
                                              decoration:
                                                  TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {})
                                    ]),
                              ),
                              checkColor: Colors.white,
                              activeColor: MyColors.violet,
                              checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              value: _isTermsChecked,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (value) {
                                setState(() {
                                  _isTermsChecked = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text('I want to receive newsletter'),
                              value: _isNewsLetterChecked,
                              checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              checkColor: Colors.white,
                              activeColor: MyColors.violet,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (value) {
                                setState(() {
                                  _isNewsLetterChecked = value!;
                                });
                              },
                            ),
                            FilledButton(
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  if (_isTermsChecked == true) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    await authentication.createAnAccount(
                                      email: emailText!,
                                      password: passwordText!,
                                      name: fullNameText!,
                                      newsletter: _isNewsLetterChecked,
                                    ).whenComplete((){
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    });
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Must agree to the terms and condition in other to register')));
                                  }
                                } else {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              },
                              style: FilledButton.styleFrom(
                                  fixedSize: Size.fromWidth(
                                      MediaQuery.of(context).size.width)),
                              child: const Text('Create an account'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                    height: 10,
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
                      CircleAvatar(
                        backgroundColor: const Color(0xFFEF403B),
                        radius: 30,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
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
                        child: const Text('Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.violet,
                              fontSize: 16,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            if (_isLoading)
              const Opacity(
                opacity: 0.8,
                child: ModalBarrier(
                  dismissible: false,
                  color: Colors.black12,
                ),
              ),
            if (_isLoading)
              Center(
                child: Lottie.asset('assets/animation/pawLoading.json',
                    height: 200, width: 200),
              )
          ],
        ),
      ),
    );
  }
}
