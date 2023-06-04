import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/business/constant/globals.dart';
import 'package:pet_care/business/constant/my_colors.dart';
import 'package:pet_care/business/cubit/is_first_time_cubit.dart';
import 'package:pet_care/presentation/pet_detail.dart';
import 'package:pet_care/presentation/vet_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final bool isFirstTime;

  HomePage({this.isFirstTime = true});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String Name = 'Maria';
  final isFirstTime = IsFirstTimeCubit();

  @override
  void initState() {
    super.initState();
    if(checkIfNewUser()){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        displayPetDetailDialog(context);
      });
    }
  }

  checkIfNewUser () async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    bool? isNewUser = await prefs.getBool('isNewUser');
    await prefs.setBool('isNewUser', true);
    print(isNewUser);
    return isNewUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: MyColors.violet,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                    text: 'What are you looking for, ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                    children: [
                      TextSpan(
                          text: Name,
                          style: const TextStyle(color: MyColors.yellow))
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  services[index]['navigation'],
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              services[index]['image'],
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(services[index]['text'])
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

displayPetDetailDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      contentPadding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: MyColors.violet,
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Add pet detail',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: MyColors.orange,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text('Faster check-in at appointment.'))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: MyColors.orange,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                          'Schedule of vaccination, haircuts, inspections etc.'))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: MyColors.orange,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                          'Reminder of the upcoming events with your pet.'))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetDetailPage(),
                      ));
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: MyColors.light_grey2,
                ),
                child: const Text(
                  'No, later',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

List<Map<String, dynamic>> services = [
  {'text': 'Veterian', 'image': Globals.vetIcon, 'navigation': const VetPage()},
  {
    'text': 'Grooming',
    'image': Globals.groomIcon,
    'navigation': const VetPage()
  },
  {
    'text': 'Pet boarding',
    'image': Globals.boardingIcon,
    'navigation': const VetPage()
  },
  {
    'text': 'Adoption',
    'image': Globals.adoptionIcon,
    'navigation': const VetPage()
  },
  {
    'text': 'Dog walking',
    'image': Globals.dogWalkingIcon,
    'navigation': const VetPage()
  },
  {
    'text': 'Training',
    'image': Globals.petTrainingIcon,
    'navigation': const VetPage()
  },
  {
    'text': 'Pet taxi',
    'image': Globals.petTaxiIcon,
    'navigation': const VetPage()
  },
  {
    'text': 'Pet Date',
    'image': Globals.petDateIcon,
    'navigation': const VetPage()
  },
  {
    'text': 'Others',
    'image': Globals.otherServicesIcon,
    'navigation': const VetPage()
  },
];
