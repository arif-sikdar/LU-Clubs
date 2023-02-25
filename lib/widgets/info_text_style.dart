import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget InfoTextStyle (String info){
  return Padding(padding: EdgeInsets.all(15.w),child: SingleChildScrollView(
    child: Container(
      child: Text(info, style: TextStyle(fontSize: 14.sp,), textAlign: TextAlign.justify,),
    ),
  ),);
}