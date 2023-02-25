import 'package:flutter/material.dart';
import 'package:lu_clubs/ui/clubs_pages/lucc/computer_club.dart';
import 'package:lu_clubs/ui/clubs_pages/lucc/lucc_events.dart';
import 'package:lu_clubs/ui/clubs_pages/lucc/lucc_user_profile.dart';
import 'package:lu_clubs/ui/sideBar.dart';

import '../../../const/main_colors.dart';
import '../lucc/lucc_reg.dart';

class ClubsBottomNav extends StatefulWidget {
  const ClubsBottomNav({Key? key}) : super(key: key);

  @override
  State<ClubsBottomNav> createState() => _ClubsBottomNavState();
}

class _ClubsBottomNavState extends State<ClubsBottomNav> {
  final _pages = [ComputerClub(), LuccEvents(), LuccReg(), LuccUser()];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: MainColors.light_grey,
        title: Text(
          'Computer Club',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: Colors.black,
        backgroundColor: MainColors.light_grey,
        unselectedItemColor: Colors.black38,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: 'Register'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'LUCC Profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
