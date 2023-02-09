import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_clubs/ui/home.dart';
import 'package:lu_clubs/widgets/formTextField.dart';

import '../const/main_colors.dart';
import '../widgets/button.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _batchController = TextEditingController();
  TextEditingController _secController = TextEditingController();
  List<String> gender = ["Male", "Female", "Other"];

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }

  sendToDB()async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "name":_nameController.text,
      "phone":_phoneController.text,
      "dob":_dobController.text,
      "gender":_genderController.text,
      "batch":_batchController.text,
      "section":_secController.text,
    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()))).catchError((error)=>print("something is wrong. $error"));
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
                    Text('Student Information',
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
                          'Fill-up the Form',
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        formTextField("Full Name",TextInputType.text,_nameController),
                        SizedBox(
                          height: 22.h,
                        ),
                        formTextField("Batch",TextInputType.number,_batchController),
                        SizedBox(
                          height: 22.h,
                        ),
                        formTextField("Section",TextInputType.text,_secController),
                        SizedBox(
                          height: 22.h,
                        ),
                        TextField(
                          controller: _dobController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "Date of Birth",
                            suffixIcon: IconButton(
                              onPressed: () => _selectDateFromPicker(context),
                              icon: Icon(Icons.calendar_today_outlined),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        formTextField("Phone",TextInputType.number,_phoneController),
                        SizedBox(
                          height: 22.h,
                        ),
                        TextField(
                          controller: _genderController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "Gender",
                            prefixIcon: DropdownButton<String>(
                              items: gender.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                  onTap: () {
                                    setState(() {
                                      _genderController.text = value;
                                    });
                                  },
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Button(
                          'SUBMIT',
                              () {
                            sendToDB();
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
