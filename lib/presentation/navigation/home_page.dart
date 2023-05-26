import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/business/constant/globals.dart';
import 'package:pet_care/business/constant/my_colors.dart';
import 'package:pet_care/presentation/vetPage.dart';

class HomePage extends StatelessWidget {
  String Name;

  HomePage({this.Name = 'Maria'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: MyColors.violet,),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
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
              SizedBox(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => services[index]['navigation'],));
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
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
                            SizedBox(
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

List<Map<String, dynamic>> services = [
  {'text': 'Veterian', 'image': Globals.vetIcon, 'navigation': VetPage()},
  {'text': 'Grooming', 'image': Globals.groomIcon, 'navigation': VetPage()},
  {
    'text': 'Pet boarding',
    'image': Globals.boardingIcon,
    'navigation': VetPage()
  },
  {'text': 'Adoption', 'image': Globals.adoptionIcon, 'navigation': VetPage()},
  {
    'text': 'Dog walking',
    'image': Globals.dogWalkingIcon,
    'navigation': VetPage()
  },
  {
    'text': 'Training',
    'image': Globals.petTrainingIcon,
    'navigation': VetPage()
  },
  {'text': 'Pet taxi', 'image': Globals.petTaxiIcon, 'navigation': VetPage()},
  {'text': 'Pet Date', 'image': Globals.petDateIcon, 'navigation': VetPage()},
  {
    'text': 'Others',
    'image': Globals.otherServicesIcon,
    'navigation': VetPage()
  },
];
