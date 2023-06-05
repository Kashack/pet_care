import 'package:flutter/material.dart';
import 'package:pet_care/business/constant/globals.dart';
import 'package:pet_care/business/constant/my_colors.dart';
import 'package:pet_care/presentation/user_detail.dart';

class PetDetailPage extends StatefulWidget {
  final bool isFirst;

  PetDetailPage({Key? key, this.isFirst = false}) : super(key: key);

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  String? gender;

  String? petName;

  String? petSize;

  TimeOfDay? petDOB;

  String? pet;

  String? petBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Add pet detail', style: TextStyle(color: Colors.black)),
        actions: [
          widget.isFirst == true ? TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetail(isFirst: true),));
          }, child: Text('Save')) : Container(),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Image.asset(Globals.demoImage),
                ),
                Positioned(
                  top: 0,
                  right: 8,
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'General \n information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Pet\'s name',
              style: TextStyle(color: MyColors.grey),
            ),
            TextFormField(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Species of your pet',
              style: TextStyle(color: MyColors.grey),
            ),
            DropdownButtonFormField(
              items: petSpecies.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Breed',
              style: TextStyle(color: MyColors.grey),
            ),
            TextFormField(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Size (optional)',
              style: TextStyle(color: MyColors.grey),
            ),
            TextFormField(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Gender',
              style: TextStyle(color: MyColors.grey),
            ),
            Row(
              children: List<Widget>.generate(
                2,(int index) {
                  int? _selectIndex;
                  return Expanded(
                    child: ChoiceChip(
                      elevation: 2,

                      backgroundColor: _selectIndex == index ? MyColors.violet : Colors.transparent,
                      label: Text('${genderList[index]}'),
                      selected: gender == genderList[index],
                      onSelected: (bool selected) {
                        setState(() {
                          gender = selected ? genderList[index] : null;
                          _selectIndex = index;
                        });
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
List genderList =['Male', 'Female'];
List<String> petSpecies = [
  'Dog',
  'Cat',
  'Fish',
  'Bird',
  'Parrot',
  'Rabbit',
  'Hamsters',
  'Others',
];
