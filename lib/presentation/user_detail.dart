import 'package:flutter/material.dart';
import 'package:pet_care/presentation/navigation/nav_page.dart';

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
      appBar: AppBar(
        elevation: 0,
        title: Text('Add pet detail', style: TextStyle(color: Colors.black)),
        actions: [
          widget.isFirst == true ? TextButton(onPressed: () {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => NavPage(),), (
                route) => false);
          }, child: Text('Save')) : Container(),
        ],
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
