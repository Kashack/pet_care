import 'package:flutter/material.dart';

class WelcomePageComponent extends StatelessWidget {
  final String ImageLocation;
  final String Title;
  final String Section;
  final int pageIndex;

  const WelcomePageComponent(
      {Key? key,
      required this.ImageLocation,
      required this.Title,
      required this.Section,
        required this.pageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageLocation),
                  fit: BoxFit.fitWidth
                )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => DotIndicator(isActive: index == pageIndex)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(Title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
            child: Text(Section,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
        ],
      ),
    );
  }

}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
          color: isActive
              ? Color(0xFFF1A852)
              : Color(0xFFE6E7F8),
          borderRadius: BorderRadius.circular(30)),
    );
  }
}


