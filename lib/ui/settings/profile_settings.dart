import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lu_clubs/widgets/update_button.dart';

import '../../const/main_colors.dart';
import '../sideBar.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {

  String name = '';
  String position = '';
  String batch = '';
  String section = '';
  String gender = '';
  String dob = '';
  String phone = '';
  String dept = '';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _batchController = TextEditingController();
  TextEditingController _secController = TextEditingController();
  TextEditingController _deptController = TextEditingController();

  _getData() async {
    User user = await FirebaseAuth.instance.currentUser!;
    var collection = FirebaseFirestore.instance.collection('users-form-data')
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
      var dept = data['dept'];

      setState(() {
        this.name = name;
        this.section = section;
        this.batch = batch;
        this.phone = phone;
        this.dept = dept;
        this.gender = gender;
        this.dob = dob;
      });
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  updateName() async{
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "userID": currentUser.uid,
      "name":_nameController.text,
      "phone": phone,
      "dob": dob,
      "gender": gender,
      "batch": batch,
      "section": section,
      "dept": dept,
    }).then((value) => Fluttertoast.showToast(msg: 'Name Updated')).catchError((error)=>print("something is wrong. $error"));
  }

  updatePhone() async{
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "userID": currentUser.uid,
      "name":name,
      "phone": _phoneController.text,
      "dob": dob,
      "gender": gender,
      "batch": batch,
      "section": section,
      "dept": dept,
    }).then((value) => Fluttertoast.showToast(msg: 'Phone Updated')).catchError((error)=>print("something is wrong. $error"));
  }

  updateSec() async{
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "userID": currentUser.uid,
      "name": name,
      "phone": phone,
      "dob": dob,
      "gender": gender,
      "batch": batch,
      "section": _secController.text,
      "dept": dept,
    }).then((value) => Fluttertoast.showToast(msg: 'Section Updated')).catchError((error)=>print("something is wrong. $error"));
  }

  updateDept() async{
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "userID": currentUser.uid,
      "name": name,
      "phone": phone,
      "dob": dob,
      "gender": gender,
      "batch": batch,
      "section": section,
      "dept": _deptController.text,
    }).then((value) => Fluttertoast.showToast(msg: 'Department Updated')).catchError((error)=>print("something is wrong. $error"));
  }

  updateBatch() async{
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "userID": currentUser.uid,
      "name":name,
      "phone": phone,
      "dob": dob,
      "gender": gender,
      "section": section,
      "dept": dept,
      "batch": _batchController.text,
    }).then((value) => Fluttertoast.showToast(msg: 'Batch Updated')).catchError((error)=>print("something is wrong. $error"));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: MainColors.light_grey,
        title: Text('Profile Setting', style: TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                //width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: MainColors.light_grey,
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
                          'Edit Your Porfile',
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 240.w,
                              child: TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: name,
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  labelText: 'Update Name',
                                  labelStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                            UpdateButton((){updateName();}),
                          ],
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 240.w,
                              child: TextField(
                                controller: _deptController,
                                decoration: InputDecoration(
                                  hintText: dept,
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  labelText: 'Update Department',
                                  labelStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                            UpdateButton((){updateDept();}),
                          ],
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 240.w,
                              child: TextField(
                                controller: _batchController,
                                decoration: InputDecoration(
                                  hintText: batch,
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  labelText: 'Update Batch',
                                  labelStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                            UpdateButton((){updateBatch();}),
                          ],
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 240.w,
                              child: TextField(
                                controller: _secController,
                                decoration: InputDecoration(
                                  hintText: section,
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  labelText: 'Update Section',
                                  labelStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                            UpdateButton((){updateSec();}),
                          ],
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 240.w,
                              child: TextField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  hintText: phone,
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  labelText: 'Update Phone',
                                  labelStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                            UpdateButton((){updatePhone();}),
                          ],
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
