import 'package:flutter/material.dart';
import 'package:lu_clubs/ui/home.dart';
import 'package:lu_clubs/ui/profile.dart';
import 'package:lu_clubs/ui/sideBar.dart';

import '../const/main_colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final _pages = [Home(), Profile()];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: MainColors.light_grey,
        title: Text('LU Clubs', style: TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          selectedItemColor: Colors.black,
          backgroundColor: MainColors.light_grey,
          unselectedItemColor: Colors.black38,
          currentIndex: _currentIndex,
          selectedLabelStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile'),
          ],
        onTap: (index){
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
