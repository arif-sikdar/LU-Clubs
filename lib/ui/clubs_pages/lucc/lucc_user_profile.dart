import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LuccUser extends StatefulWidget {
  const LuccUser({Key? key}) : super(key: key);

  @override
  State<LuccUser> createState() => _LuccUserState();
}

class _LuccUserState extends State<LuccUser> {

  String name = '';
  String position = '';
  String batch = '';
  String section = '';
  String gender = '';
  String dob = '';
  String phone = '';
  String dept = '';
  String status = '';

  _regStatus() async {
    User user = await FirebaseAuth.instance.currentUser!;
    var collection = FirebaseFirestore.instance.collection('approve')
        .where("userID", isEqualTo: user.uid);
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var status = data['status'];

      setState(() {
        this.status = status;
      });
    }
  }

  _getData() async {
    User user = await FirebaseAuth.instance.currentUser!;
    var collection = FirebaseFirestore.instance.collection('lucc-reg-info')
        .where("userID", isEqualTo: user.uid);
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var name = data['name'];
      var section = data['section'];
      var batch = data['batch'];
      var dob = data['dob'];
      var phone = data['phone'];
      var gender = data['gender'];
      var position = data['position'];
      var dept = data['dept'];


      setState(() {
        this.name = name;
        this.section = section;
        this.gender = gender;
        this.position = position;
        this.dob = dob;
        this.batch = batch;
        this.phone = phone;
        this.dept = dept;
      });
    }
  }
  void initState() {
    super.initState();
    _getData();
    _regStatus();
  }

  @override
  Widget build(BuildContext context) {
    if(status == "approved"){
      return Scaffold(
        body: SafeArea(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 22.h,
                  ),
                  Text(
                    'LUCC User Profile',
                    style:
                    TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Text(
                    name,
                    style:
                    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    position,
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        width: 206.5.w,
                        child: Text(
                          'Department: ',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        dept,
                        style: TextStyle(fontSize: 16.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        width: 206.5.w,
                        child: Text(
                          'Batch: ',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        batch,
                        style: TextStyle(fontSize: 16.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        width: 206.5.w,
                        child: Text(
                          'Section: ',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        section,
                        style: TextStyle(fontSize: 16.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        width: 206.5.w,
                        child: Text(
                          'Gender: ',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        gender,
                        style: TextStyle(fontSize: 16.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        width: 206.5.w,
                        child: Text(
                          'Date of Birth: ',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        dob,
                        style: TextStyle(fontSize: 16.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        width: 206.5.w,
                        child: Text(
                          'Phone: ',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        phone,
                        style: TextStyle(fontSize: 16.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    else{
      return Scaffold(
        body: SafeArea(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200.h,),
                  Center(
                    child: Container(
                      child: Text('You are not Registered!',style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ]
              ),
            ),
          ),
        ),
      );
    }

  }
}
