import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_clubs/const/main_colors.dart';
import 'package:lu_clubs/ui/login.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),()=>Navigator.push(context, CupertinoPageRoute(builder: (_)=>Login())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.light_grey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 139.h,
                width: 133.w,
                child: Image.asset("images/lu_logo.png"),
              ),
              SizedBox(height: 24.h,),
              Text(
                "LU CLUBS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
              ),
              SizedBox(height: 24.h,),
              CircularProgressIndicator(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
