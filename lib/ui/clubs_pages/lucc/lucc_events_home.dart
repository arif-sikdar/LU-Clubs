import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LuccEventsHome extends StatefulWidget {
  var _events;
  LuccEventsHome(this._events);

  @override
  State<LuccEventsHome> createState() => _LuccEventsHomeState();
}

class _LuccEventsHomeState extends State<LuccEventsHome> {

  String name = '';
  String details = '';
  String img = '';
 
  _getData() async {
    var collection = FirebaseFirestore.instance.collection('lucc-events')
        .where("name", isEqualTo: widget._events["name"]);
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var name = data['name'];
      var img = data['img'];
      var details = data['details'];


      setState(() {
        this.name = name;
        this.details = details;
        this.img = img;
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
                Container(
                  width: 393.w,
                  height: 200.h,
                  child: Image.network(img, width: 393.w, scale: 1,),
                ),
                SizedBox(height: 22.h,),
                Text(name, style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,),),
                Text(details, style: TextStyle(fontSize: 14.sp, ), textAlign: TextAlign.justify,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
