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
  int? tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: MyColors.violet),
        title: Text('Your Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          widget.isFirst == true
              ? TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavPage(),
                        ),
                        (route) => false);
                  },
                  child: Text('Skip'))
              : Container(),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              TextFormField(
                decoration: InputDecoration(
                    label: Text(
                  'Full name',
                  style: TextStyle(color: MyColors.grey),
                )),
              ),
              Text(
                'Gender',
                style: TextStyle(color: MyColors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: List.generate(
                  genderList.length,
                  (int index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                          elevation: tag == index ? 2 : 0,
                          selected: tag == index,
                          backgroundColor: Colors.white,
                          labelPadding: EdgeInsets.symmetric(horizontal: 8),
                          iconTheme: IconThemeData(
                            color:
                                tag != null ? Colors.lightBlue : Colors.white,
                          ),
                          pressElevation: 5,
                          labelStyle: tag == index
                              ? const TextStyle(color: Colors.white)
                              : const TextStyle(color: Colors.black),
                          selectedColor: MyColors.violet,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                              side: tag == index
                                  ? BorderSide.none
                                  : const BorderSide(color: MyColors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              index == 1
                                  ? Icon(
                                      Icons.female,
                                      color: tag == index
                                          ? Colors.white
                                          : MyColors.pink,
                                    )
                                  : Icon(
                                      Icons.male,
                                      color: tag == index
                                          ? Colors.white
                                          : MyColors.red,
                                    ),
                              Text('${genderList[index]}'),
                            ],
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              // gender = selected ? genderList[index] : null;
                              tag = (selected ? index : null)!;
                            });
                          },
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    label: Text(
                  'email',
                  style: TextStyle(color: MyColors.grey),
                )),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Phone',
                    style: TextStyle(color: MyColors.grey),
                  ),
                  icon: Text('+234'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'About me',
                style: TextStyle(color: MyColors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Color(0xFFE4E3F3),
                ),
              ),
              FilledButton(
                onPressed: () {},
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List genderList = ['Male', 'Female'];
