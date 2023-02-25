import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget MemberInfo(String link, String name, String position){
  return Center(
    child: Column(
      children: [
        Container(
          height: 139.h,
          width: 139.h,
          child: Image.asset(link),
        ),
        SizedBox(height: 10.h,),
        Text(name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
        Text(position, style: TextStyle(fontSize: 15.sp,),),
        SizedBox(height: 15.h,)
      ],
    ),
  );
}