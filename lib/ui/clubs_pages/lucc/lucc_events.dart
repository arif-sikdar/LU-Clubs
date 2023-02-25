import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_clubs/ui/sideBar.dart';

import '../../../const/main_colors.dart';
import 'lucc_events_home.dart';

class LuccEvents extends StatefulWidget {
  const LuccEvents({Key? key}) : super(key: key);

  @override
  State<LuccEvents> createState() => _LuccEventsState();
}

class _LuccEventsState extends State<LuccEvents> {

  List _events = [];

  _fetchEvents() async {
    QuerySnapshot qn = await FirebaseFirestore.instance.collection("lucc-events").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _events.add({
          "name": qn.docs[i]["name"],
          "img": qn.docs[i]["img"],
        });
      }
    });
    return qn.docs;
  }

  void initState() {
    super.initState();
    _fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: _events.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,childAspectRatio: 1,
                    ),
                    itemBuilder: (_, index){
                      return GestureDetector(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>LuccEventsHome(_events[index]))),
                        child: Card(
                          color: MainColors.light_grey,
                          elevation: 2,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AspectRatio(aspectRatio: 2,
                                child: Container(
                                  color: MainColors.light_grey,
                                  child: Image.network( _events[index]["img"],),
                                ),),
                                SizedBox(height: 22.h,),
                                Text("${_events[index]["name"]}"),
                              ],
                            ),
                          ),
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
