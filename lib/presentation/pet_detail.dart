import 'package:flutter/material.dart';
import 'package:pet_care/business/constant/globals.dart';
import 'package:pet_care/business/constant/my_colors.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add pet detail'),
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
            Text('General \n information',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Pet\'s name', style: TextStyle(color: MyColors.grey),),
            TextFormField(),
            SizedBox(
              height: 10,
            ),
            Text('Species of your pet', style: TextStyle(color: MyColors.grey),),
            DropdownButtonFormField(items: [], onChanged: (value) {

            },),
            SizedBox(
              height: 10,
            ),
            Text('Breed', style: TextStyle(color: MyColors.grey),),
            TextFormField(),
            SizedBox(
              height: 10,
            ),
            Text('Size (optional)', style: TextStyle(color: MyColors.grey),),
            TextFormField(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
