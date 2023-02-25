import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lu_clubs/ui/form.dart';
import 'package:lu_clubs/ui/login.dart';

import '../const/main_colors.dart';
import '../widgets/button.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  void _sendVerificationEmail() async {
    final user = await FirebaseAuth.instance.currentUser;
    user?.sendEmailVerification();
    setState(() {
      Fluttertoast.showToast(
          msg: 'Verification email sent. Please check your email.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 188.h,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('LU CLUBS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: MainColors.light_grey,
                  borderRadius: BorderRadius.all(Radius.circular(40.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Email Verification',
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Please verify your Email!',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Button(
                          'Send Link',
                          () {
                            _sendVerificationEmail();
                          },
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Text('Fill up the User Form First!', style: TextStyle(fontSize: 20.sp),),
                        SizedBox(height: 22,),
                        Button('User Form', () {
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => UserForm()));
                        }),
                        SizedBox(height: 150.h,),
                        Center(
                          child: GestureDetector(
                            child: Text('Login Here', style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold,decoration: TextDecoration.underline),textAlign: TextAlign.center,),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => Login()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
