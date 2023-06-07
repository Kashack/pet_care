import 'package:flutter/material.dart';
import 'package:pet_care/presentation/navigation/nav_page.dart';

import '../business/constant/globals.dart';
import '../business/constant/my_colors.dart';

class UserDetail extends StatefulWidget {
  final bool isFirst;

  const UserDetail({Key? key, this.isFirst = false}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: MyColors.violet),
        title: Text('Add pet detail', style: TextStyle(color: Colors.black)),
        actions: [
          widget.isFirst == true ? TextButton(onPressed: () {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => NavPage(),), (
                route) => false);
          }, child: Text('Skip')) : Container(),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: AssetImage(Globals.demoImage), fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 8,
                    child: GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              stops: [
                                0.2,
                                0.8,
                              ],
                              colors: [
                                Color(0xFF4596EA),
                                Color(0xFF4552CB),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
