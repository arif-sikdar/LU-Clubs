import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lu_clubs/ui/settings/profile_settings.dart';
import 'package:lu_clubs/ui/sideBar.dart';

import '../../const/main_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: MainColors.light_grey,
        title: Text('Settings', style: TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile Setting"),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_) => ProfileSettings()));
            },
          ),
        ],
      ),
    );
  }
}
