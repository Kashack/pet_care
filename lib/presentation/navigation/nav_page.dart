import 'package:flutter/material.dart';
import 'package:pet_care/business/constant/my_colors.dart';
import 'package:pet_care/presentation/navigation/appointment_page.dart';
import 'package:pet_care/presentation/navigation/explore_page.dart';
import 'package:pet_care/presentation/navigation/home_page.dart';
import 'package:pet_care/presentation/navigation/profile_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectindex = 0;
  List navPage = [
    HomePage(),
    AppointmentPage(),
    ExplorePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navPage[_selectindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectindex,
        onTap: (value) => setState(() {
          _selectindex = value;
        }),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search, color: MyColors.violet),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            activeIcon: Icon(Icons.access_time_filled, color: MyColors.violet),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore_rounded, color: MyColors.violet),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: MyColors.violet),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
