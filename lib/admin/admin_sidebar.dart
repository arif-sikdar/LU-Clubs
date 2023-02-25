
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui/login.dart';
import 'admin_home.dart';

class AdminSideBar extends StatefulWidget {
  @override
  State<AdminSideBar> createState() => _AdminSideBarState();
}

class _AdminSideBarState extends State<AdminSideBar> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 120.h, child: Container(
            child: Center(
              child: Text('Admin Panel', style: TextStyle(
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
            onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => AdminHome())),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => Login()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('settings'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}

Widget build(BuildContext context) {
  return Container();
}
