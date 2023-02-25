import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ludc extends StatefulWidget {
  const Ludc({Key? key}) : super(key: key);

  @override
  State<Ludc> createState() => _LudcState();
}

class _LudcState extends State<Ludc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This Club Feature is not available yet!', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
