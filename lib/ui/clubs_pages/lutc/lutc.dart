import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lutc extends StatefulWidget {
  const Lutc({Key? key}) : super(key: key);

  @override
  State<Lutc> createState() => _LutcState();
}

class _LutcState extends State<Lutc> {
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
