

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lu_clubs/widgets/button.dart';

class Approve extends StatefulWidget {
  var _user;
  Approve(this._user);

  @override
  State<Approve> createState() => _ApproveState();
}

class _ApproveState extends State<Approve> {

  _approveReg(){
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("approve");
    return _collectionRef.doc(widget._user["userID"]).set({
      'status': "approved",
      'userID': widget._user["userID"],
    }).then((value) => Fluttertoast.showToast(msg: 'Registration Approved').catchError((error)=>print("something is wrong. $error")));
  }

  _declineReg(){
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("approve");
    return _collectionRef.doc(widget._user["userID"]).set({
      'status': "decline",
      'userID': widget._user["userID"],
    }).then((value) => Fluttertoast.showToast(msg: 'Registration Declined').catchError((error)=>print("something is wrong. $error")));
  }

  String name = '';
  String position = '';
  String batch = '';
  String section = '';
  String gender = '';
  String dob = '';
  String phone = '';
  String dept = '';
  String transactionNumber = '';
  String bkashNumber = '';
  String amount = '';

  _getData() async {
    var collection = FirebaseFirestore.instance.collection('lucc-reg-info')
        .where("userID", isEqualTo: widget._user["userID"]);
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
      var transactionNumber = data['transactionNumber'];
      var amount = data['amount'];
      var bkashNumber = data['bkashNumber'];


      setState(() {
        this.name = name;
        this.section = section;
        this.gender = gender;
        this.position = position;
        this.dob = dob;
        this.batch = batch;
        this.phone = phone;
        this.dept = dept;
        this.amount = amount;
        this.bkashNumber = bkashNumber;
        this.transactionNumber = transactionNumber;
      });
    }
  }
  void initState() {
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
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
                  'Approve For the Registration',
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
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.w),
                      width: 206.5.w,
                      child: Text(
                        'bkash Number: ',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      bkashNumber,
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
                        'Transaction Number: ',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      transactionNumber,
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
                        'Amount: ',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      amount,
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Row(
                    children: [
                      Button('Approve', (){
                        _approveReg();
                      }),
                      SizedBox(width: 20.w,),
                      Button('Decline', (){
                        _declineReg();
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
