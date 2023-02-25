import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/main_colors.dart';
import '../widgets/button.dart';
import 'admin_home.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  signIn(){
    if(_unameController.text == 'admin' && _passwordController.text == 'admin@123'){
      Navigator.push(context, CupertinoPageRoute(builder: (_) => AdminHome()));
    }
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
                    Text('Admin',
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
                          'Login',
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Please Sign in to continue',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _unameController,
                                decoration: InputDecoration(
                                  hintText: "Enter your username",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30.h,
                              width: 30.w,
                              child: Center(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 25.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  suffixIcon: _obscureText == true
                                      ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        size: 25.w,
                                      ))
                                      : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = true;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.visibility_off,
                                      size: 25.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30.h,
                              width: 30.w,
                              child: Center(
                                child: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                  size: 25.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 63.h,
                        ),
                        Button(
                          'LOGIN',
                              () {
                            signIn();
                          },
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
