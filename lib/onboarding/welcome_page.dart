import 'package:flutter/material.dart';

import 'welcome_page_component.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController _pageViewController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> onboard_slides = slides
        .map((item) => WelcomePageComponent(
            ImageLocation: item['image'],
            Title: item['title'],
            Section: item['section'],
            pageIndex: _pageIndex))
        .toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(onPressed: () {}, child: Text('Sign In')),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return onboard_slides[index];
                },
              ),
            ),
            FilledButton(
              onPressed: () {},
              child: Text('Next'),
              style: FilledButton.styleFrom(

              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List slides = [
  {
    'image': 'assets/images/OnboardingImage1.png',
    'title': 'Welcome to Pet Care',
    'section':
        'All types of services for your pet in one place, instantly searchable.',
  },
  {
    'image': 'assets/images/OnboardingImage2.png',
    'title': 'Proven experts',
    'section': 'We interview every specialist before they get to work.',
  },
  {
    'image': 'assets/images/OnboardingImage3.png',
    'title': 'Reliable reviews',
    'section': 'A review can be left only by a user who used the service.',
  },
];
