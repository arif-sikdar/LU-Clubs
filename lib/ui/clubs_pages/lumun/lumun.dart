import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lumun extends StatefulWidget {
  const Lumun({Key? key}) : super(key: key);

  @override
  State<Lumun> createState() => _LumunState();
}

class _LumunState extends State<Lumun> {
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
