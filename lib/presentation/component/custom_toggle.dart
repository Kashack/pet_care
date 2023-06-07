import 'package:flutter/material.dart';

import '../../business/constant/my_colors.dart';

class MyCustomToggleList extends StatefulWidget {
  final String titleText;
  final Function callback;

  MyCustomToggleList(
      {Key? key, required this.titleText, required this.callback})
      : super(key: key);

  @override
  State<MyCustomToggleList> createState() => _MyCustomToggleListState();
}

class _MyCustomToggleListState extends State<MyCustomToggleList> {
  bool tag = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.titleText),
      value: tag,
      onChanged: (bool value) {
        setState(() {
          tag = value;
          widget.callback(tag);
        });
      },
      contentPadding: EdgeInsets.zero,
      activeColor: Colors.white,
      activeTrackColor: MyColors.violet,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey.shade400,
    );
  }
}