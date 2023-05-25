import 'package:flutter/material.dart';
import 'package:pet_care/business/constant/my_colors.dart';

class HomePage extends StatelessWidget {
  String Name;

  HomePage({this.Name = 'Maria'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                  text: 'What are you looking for, ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  children: [
                    TextSpan(
                        text: Name, style: TextStyle(color: MyColors.yellow))
                  ]),
            ),
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}
