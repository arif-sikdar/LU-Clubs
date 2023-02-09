import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Button (String buttonText,onPressed){
  return Center(
    child: SizedBox(
      width: 170.w,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.bold),
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