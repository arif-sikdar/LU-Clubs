
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_clubs/ui/btm_nav.dart';
import 'package:lu_clubs/ui/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../admin/admin_login.dart';
import 'login.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 120.h, child: Container(
            child: Center(
              child: Text('LU CLUBS', style: TextStyle(
                color: Colors.white,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),),
            ),
              decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => BottomNav())),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.admin_panel_settings),
            title: Text('Admin Login'),
            onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => AdminLogin())),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.clear();
              Navigator.push(context, CupertinoPageRoute(builder: (_) => Login()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => SettingsPage())),
          ),
        ],
      ),
    );
  }
}

Widget build(BuildContext context) {
  return Container();
}
