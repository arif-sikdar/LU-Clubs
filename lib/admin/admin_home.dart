import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lu_clubs/admin/admin_sidebar.dart';
import 'package:lu_clubs/admin/approve.dart';

import '../const/main_colors.dart';


class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  List _user = [];

  _getData() async {
    QuerySnapshot qn = await FirebaseFirestore.instance.collection('lucc-reg-info').get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _user.add({
          "name": qn.docs[i]["name"],
          "position": qn.docs[i]["position"],
          "userID": qn.docs[i]["userID"],
        });
      }
    });
    return qn.docs;
  }
  void initState() {
    super.initState();
    _getData();
  }

  //int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminSideBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: MainColors.light_grey,
        title: Text('Admin Panel', style: TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _user.length,
                    itemBuilder: (_, index){
                      return GestureDetector(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Approve(_user[index]))),
                        child: ListTile(
                          title: Text("${_user[index]["name"]}"),
                          subtitle: Text("${_user[index]["position"]}"),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
