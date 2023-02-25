import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_clubs/const/main_colors.dart';

Widget LogoButton(String link, onPressed){
  return Center(
    child: Padding(
      padding: EdgeInsets.all(5.w),
      child: SizedBox(
        width: 142.w,
        height: 142.h,
        child: ElevatedButton(
          child: Image.asset(link),
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
            ),
            primary: MainColors.light_grey,
            elevation: 3,
          ),
        ),
      ),
    ),
  );
}