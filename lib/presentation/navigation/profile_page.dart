import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_care/business/constant/globals.dart';
import 'package:pet_care/business/constant/my_colors.dart';
import 'package:pet_care/presentation/authentication/registration_page.dart';
import 'package:pet_care/presentation/component/my_profile_tile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatelessWidget {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    // print(supabase.auth.currentSession!.user.email);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Profile',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          actions: [
            TextButton.icon(
                onPressed: () {}, icon: Icon(Icons.edit), label: Text('Edit'))
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                  boxShadow: [BoxShadow(color: Colors.black45)],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset(Globals.demoImage),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'UserName',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Email'),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyProfileTile(
                        tileText: 'My pets',
                        leadingIcon: SvgPicture.asset(Globals.petIcon),
                        trailingIcon: Icons.arrow_forward_ios,
                      ),
                      MyProfileTile(
                        tileText: 'My favorites',
                        leadingIcon: Icon(Icons.favorite_border,color: MyColors.violet),
                        trailingIcon: Icons.arrow_forward_ios,
                      ),
                      MyProfileTile(
                        tileText: 'Add pet service',
                        leadingIcon: SvgPicture.asset(Globals.medicBriefIcon),
                        trailingIcon: Icons.arrow_forward_ios,
                      ),
                      MyProfileTile(
                        tileText: 'Invite friends',
                        leadingIcon: SvgPicture.asset(Globals.announcementIcon),
                        trailingIcon: Icons.arrow_forward_ios,
                      ),
                      MyProfileTile(
                        tileText: 'Help',
                        leadingIcon: Icon(Icons.help_outline,color: MyColors.violet),
                        trailingIcon: Icons.arrow_forward_ios,
                      ),
                      MyProfileTile(
                        tileText: 'Settings',
                        leadingIcon: Icon(Icons.settings,color: MyColors.violet),
                        trailingIcon: Icons.arrow_forward_ios,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
