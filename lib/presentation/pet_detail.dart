import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/business/constant/globals.dart';
import 'package:pet_care/business/constant/my_colors.dart';
import 'package:pet_care/presentation/user_detail.dart';

import 'component/custom_toggle.dart';

class PetDetailPage extends StatefulWidget {
  final bool isFirst;

  PetDetailPage({Key? key, this.isFirst = false}) : super(key: key);

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  String? gender;
  int? tag;
  bool isNeutered = false;
  bool isVaccinated = false;
  bool isMicrochipped = false;
  bool isPurebed = false;
  bool isFriendlyWDogs = false;
  bool isFriendlyWCats = false;
  bool isFriendlyWKidsLess10 = false;
  bool isFriendlyWKidsMore10 = false;
  String? petName;
  String? petSize;
  TimeOfDay? petDOB;
  String? pet;
  String? petBreed;
  late DateTime DOB;

  @override
  void initState() {
    super.initState();
    DOB = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: MyColors.violet),
        title: Text('Add pet detail', style: TextStyle(color: Colors.black)),
        actions: [
          widget.isFirst == true
              ? TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetail(isFirst: true),
                        ));
                  },
                  child: Text('Skip'))
              : Container(),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
            SizedBox(
              height: 40,
            ),
            Text(
              'General \ninformation',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            TextFormField(
              onChanged: (value) {
                setState(() {
                  petName = value;
                });
              },
              decoration: InputDecoration(
                  label: Text('Pet\'s name',style: TextStyle(color: MyColors.grey),)
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  label: Text('Species of your pet',style: TextStyle(color: MyColors.grey),)
              ),
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
            TextFormField(
              decoration: InputDecoration(
                  label: Text('Size (optional)',style: TextStyle(color: MyColors.grey),)
              ),
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
            ),
            SizedBox(
              height: 15,
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
                          color: tag != null ? Colors.lightBlue : Colors.white,
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
                                    color: tag == index ? Colors.white : MyColors.pink,
                                  )
                                : Icon(
                                    Icons.male,
                                    color: tag == index ? Colors.white : MyColors.red,
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
            TextField(
                decoration: InputDecoration(
                    label: Text('Date of birth',style: TextStyle(color: MyColors.grey),),
                  suffixIcon: Icon(Icons.calendar_today),
                  hintText: '${DOB.year}/${DOB.month}/${DOB.day}'
                ),
                readOnly: true,
                onTap: () async {
                 DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DOB, //get today's date
                      firstDate:DateTime(1980),
                      lastDate: DateTime(2101),
                  );
                 if(newDate == null) return;

                 setState(() {
                   DOB = newDate;
                 });
                }
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Additional Information',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            MyCustomToggleList(
              titleText: 'Neutered',
              callback: (value) {
                print(value);
                setState(() {
                  isNeutered = value;
                });
              },
            ),
            MyCustomToggleList(
              titleText: 'Vaccinated',
              callback: (value) => setState(() => isVaccinated = value),
            ),
            MyCustomToggleList(
              titleText: 'Friendly with dogs',
              callback: (value) => setState(() => isFriendlyWDogs = value),
            ),
            MyCustomToggleList(
              titleText: 'Friendly with cats',
              callback: (value) => setState(() => isFriendlyWCats = value),
            ),
            MyCustomToggleList(
              titleText: 'Friendly with kids <10 year',
              callback: (value) =>
                  setState(() => isFriendlyWKidsLess10 = value),
            ),
            MyCustomToggleList(
              titleText: 'Friendly with kids >10 year',
              callback: (value) =>
                  setState(() => isFriendlyWKidsMore10 = value),
            ),
            MyCustomToggleList(
              titleText: 'Microchipped',
              callback: (value) => setState(() => isMicrochipped = value),
            ),
            MyCustomToggleList(
              titleText: 'Purebred',
              callback: (value) => setState(() => isPurebed = value),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Pet’s nursery name (optional)',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Reminder',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Text(
              'Add vaccines, haircuts, pills, estrus, etc. and you will receive notifications for the next event.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Container(
                    height: 150,
                    // width: 150,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: MyColors.light_grey2,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
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
                              borderRadius: BorderRadius.circular(50),
                            ),
                            margin: EdgeInsets.all(8),
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                        Text('Add Event', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FilledButton(
                onPressed: () {},
                child: Text(widget.isFirst ? "Next" : "Update"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List genderList = ['Male', 'Female'];
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
