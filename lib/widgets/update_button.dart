import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget UpdateButton (onPressed){
  return Center(
    child: SizedBox(
      width: 100.w,
      height: 30.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          "Update",
          style: TextStyle(
              color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r)
          ),
          primary: Colors.black,
          elevation: 3,
        ),
      ),
    ),
  );
}