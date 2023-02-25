import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lussc extends StatefulWidget {
  const Lussc({Key? key}) : super(key: key);

  @override
  State<Lussc> createState() => _LusscState();
}

class _LusscState extends State<Lussc> {
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
