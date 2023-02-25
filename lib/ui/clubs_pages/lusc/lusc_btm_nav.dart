import 'package:flutter/material.dart';
import 'package:lu_clubs/ui/clubs_pages/lusc/lusc_events.dart';
import 'package:lu_clubs/ui/clubs_pages/lusc/lusc_reg.dart';
import 'package:lu_clubs/ui/clubs_pages/lusc/lusc_user_profile.dart';
import 'package:lu_clubs/ui/clubs_pages/lusc/sports_club.dart';

import '../../../const/main_colors.dart';
import '../../sideBar.dart';

class LuscBtmNav extends StatefulWidget {
  const LuscBtmNav({Key? key}) : super(key: key);

  @override
  State<LuscBtmNav> createState() => _LuscBtmNavState();
}

class _LuscBtmNavState extends State<LuscBtmNav> {
  final _pages = [SportsClub(), LuscEvents(), LuscReg(), LuscUserProfile()];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: MainColors.light_grey,
        title: Text(
          'Sports Club',
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
              icon: Icon(Icons.person), label: 'LUSC Profile'),
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
