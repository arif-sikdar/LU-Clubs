import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lu_clubs/const/main_colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String position = '';
  String batch = '';
  String section = '';
  String gender = '';
  String dob = '';
  String phone = '';
  String dept = '';

  String imageUrl = " ";

  void _pickUploadImage() async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 75,
    );

    Reference ref = FirebaseStorage.instance.ref().child(currentUser!.uid);

    await ref.putFile(File(image!.path));
    // ref.getDownloadURL().then((value){
    //   print(value);
    //   setState(() {
    //     imageUrl = value;
    //   });
    // });
  }

  _profilePic() async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;
    final storageRef = FirebaseStorage.instance.ref();
    final imgUrl =  await storageRef.child(currentUser!.uid).getDownloadURL();

    setState(() {
      imageUrl = imgUrl;
    });
  }

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
        this.gender = gender;
        this.dob = dob;
        this.batch = batch;
        this.phone = phone;
        this.dept = dept;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
    _profilePic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13,),
                  child: Center(
                    child: Container(
                      height: 130.h,
                      width: 130.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.w ,color: MainColors.light_grey)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.sw),
                        child: imageUrl == " " ? Icon(
                          Icons.person, size: 50, color: Colors.black,
                        ) : Image.network(imageUrl),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _pickUploadImage();
                  },
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.add, size: 18, color: Colors.white,),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.w),
                  width: 206.5.w,
                  child: Text(
                    'Name: ',
                    style: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  name,
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
    );
  }
}
