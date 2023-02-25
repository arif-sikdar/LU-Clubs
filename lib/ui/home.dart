import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_clubs/ui/clubs_pages/lucc/clubs_btm_nav.dart';
import 'package:lu_clubs/ui/clubs_pages/ludc/debating_club.dart';
import 'package:lu_clubs/ui/clubs_pages/lumun/lumun.dart';
import 'package:lu_clubs/ui/clubs_pages/lusc/lusc_btm_nav.dart';
import 'package:lu_clubs/ui/clubs_pages/lussc/lussc.dart';
import 'package:lu_clubs/ui/clubs_pages/lutc/lutc.dart';
import 'package:lu_clubs/widgets/logoButton.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 22.h,),
                Text('Clubs List', style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold
                ),),
                Text('Click on any club to see the details and register!'),
                SizedBox(height: 22.h,),
                Row(
                  children: [
                    Container(
                      width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/clubs/lucc.jpg", (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => ClubsBottomNav()));
                        }))),
                    Container(
                        width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/clubs/lusc.jpg", (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => LuscBtmNav()));
                        }))),
                  ],
                ),
                SizedBox(height: 22.h,),
                Row(
                  children: [
                    Container(
                        width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/clubs/ludc.jpg", (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => Ludc()));
                        }))),
                    Container(
                        width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/clubs/lussc.jpg", (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => Lussc()));
                        }))),
                  ],
                ),
                SizedBox(height: 22.h,),
                Row(
                  children: [
                    Container(
                        width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/clubs/tour.jpg", (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => Lutc()));
                        }))),
                    Container(
                        width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/clubs/lumun.jpg", (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => Lumun()));
                        }))),
                  ],
                ),
                SizedBox(height: 22.h,),
                Row(
                  children: [
                    Container(
                        width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/lu_logo.png", (){}))),
                    Container(
                        width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/lu_logo.png", (){}))),
                  ],
                ),
                SizedBox(height: 22.h,),
                Row(
                  children: [
                    Container(
                        width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/lu_logo.png", (){}))),
                    Container(
                        width: 196.5.w,
                        height: 142.h,
                        child: Center(child: LogoButton("images/lu_logo.png", (){}))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
