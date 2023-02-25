import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lu_clubs/widgets/button.dart';

import '../../../const/main_colors.dart';
import '../../../widgets/formTextField.dart';

class LuccReg extends StatefulWidget {
  const LuccReg({Key? key}) : super(key: key);

  @override
  State<LuccReg> createState() => _LuccRegState();
}

class _LuccRegState extends State<LuccReg> {
  TextEditingController _positionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _transactionController = TextEditingController();
  List<String> position = ["General Member", "Executive Member"];

  _declineReg(){
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("approve");
    return _collectionRef.doc(currentUser?.uid).set({
      'status': "decline",
      'userID': currentUser?.uid,
    }).then((value) => _sendtoDB().catchError((error)=>print("something is wrong. $error")));
  }

  _sendtoDB() async{
    User user = await FirebaseAuth.instance.currentUser!;
    var collection = FirebaseFirestore.instance.collection('users-form-data').where("userID", isEqualTo: user.uid);
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

      final FirebaseAuth _auth = FirebaseAuth.instance;
      var  currentUser = _auth.currentUser;

      CollectionReference _collectionRef = FirebaseFirestore.instance.collection("lucc-reg-info");
      return _collectionRef.doc(currentUser!.email).set({
        "userID": currentUser.uid,
        "name":name,
        "phone":phone,
        "dob":dob,
        "gender":gender,
        "batch":batch,
        "section":section,
        "dept": dept,
        "position":_positionController.text,
        "amount":_amountController.text,
        "bkashNumber":_phoneController.text,
        "transactionNumber":_transactionController.text,
      }).then((value) => Fluttertoast.showToast(msg: 'Registered Successfully').catchError((error)=>print("something is wrong. $error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            width: ScreenUtil().screenWidth,
            height: 852.h,
            decoration: BoxDecoration(
              color: MainColors.light_grey,
            ),
            child: Padding(
              padding: EdgeInsets.all(25.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Text('LUCC Registration', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    Text('Pay the Registration Fees', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    SizedBox(height: 10.h,),
                    Text('Bkash Number: 01600000000, 01700000000', style: TextStyle(fontSize: 16.sp), textAlign: TextAlign.center,),
                    Text('General Member: 500 TK', style: TextStyle(fontSize: 16.sp), textAlign: TextAlign.center,),
                    Text('Executive Member: 700 TK', style: TextStyle(fontSize: 16.sp), textAlign: TextAlign.center,),

                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      'Fill-up the Form',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    formTextField("Bkash Number",TextInputType.number,_phoneController),
                    SizedBox(
                      height: 22.h,
                    ),
                    formTextField("Transaction Number",TextInputType.text,_transactionController),
                    SizedBox(
                      height: 22.h,
                    ),
                    TextField(
                      controller: _positionController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Position",
                        prefixIcon: DropdownButton<String>(
                          items: position.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                              onTap: () {
                                setState(() {
                                  _positionController.text = value;
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
                    formTextField("Amount",TextInputType.number,_amountController),
                    SizedBox(
                      height: 22.h,
                    ),
                    Button(
                      'Register',
                          () {
                        _declineReg();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
