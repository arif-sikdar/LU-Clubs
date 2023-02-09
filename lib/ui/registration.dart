import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lu_clubs/ui/form.dart';

import '../const/main_colors.dart';
import '../widgets/button.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  signUp()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>UserForm()));
      }
      else{
        Fluttertoast.showToast(msg: "Something is wrong");
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");

      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account already exists for that email.");

      }
    } catch (e) {
      print(e);
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
                    Text('Welcome to\nLU CLUBS',
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
                          'Create Account',
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: "someone@example.com",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  labelText: 'E-mail',
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
                                  Icons.email_outlined,
                                  color: Colors.black,
                                  size: 25.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 22.h,),
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
                          height: 22.h,
                        ),
                        SizedBox(
                          height: 63.h,
                        ),
                        Button(
                          'Sign UP',
                              () {
                            signUp();
                              },
                        ),
                        SizedBox(height: 50.h,),
                        Center(
                          child: Wrap(
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              GestureDetector(
                                child: Text(
                                  " Sign In",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: (){
                                  Navigator.push(context, CupertinoPageRoute(builder: (_)=>Registration()));
                                },
                              ),
                            ],
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
