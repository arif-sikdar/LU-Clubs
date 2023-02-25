import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_clubs/const/info_text.dart';
import 'package:lu_clubs/ui/clubs_pages/lucc/lucc_reg.dart';
import 'package:lu_clubs/widgets/button.dart';
import 'package:lu_clubs/widgets/club_members.dart';
import 'package:lu_clubs/widgets/info_text_style.dart';

import '../../../const/main_colors.dart';

class ComputerClub extends StatefulWidget {
  const ComputerClub({Key? key}) : super(key: key);

  @override
  State<ComputerClub> createState() => _ComputerClubState();
}

class _ComputerClubState extends State<ComputerClub> {
  List imageList = [
    {"id": 1, "image_path": 'images/lucc/lucc_one.jpg'},
    {"id": 2, "image_path": 'images/lucc/lucc_two.jpg'},
    {"id": 3, "image_path": 'images/lucc/lucc_three.jpg'}
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity.w,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17 : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Colors.black
                                    : MainColors.light_grey),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Button('REGISTER', () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => LuccReg()));
              }),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Leading University Computer Club',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              InfoTextStyle(InfoText().lucc),
              SizedBox(height: 22.h,),
              Text(
                'Steering Committee',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 15.h,),
              SingleChildScrollView(
                child: Container(
                  width: 350.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.w,
                    ),
                  ),
                  child: Column(
                    children: [
                      MemberInfo('images/members/arafat_sir.jpg', 'Arafat Habib Quraishi', 'Advisor'),
                      MemberInfo('images/members/adil_sir.png', 'Adil Ahmed Chowdhury', 'Co-Advisor'),
                      MemberInfo('images/members/prithwi_sir.jpg', 'Prithwiraj Bhattacharjee', 'Co-Advisor'),
                      MemberInfo('images/members/fahim.jpg', 'Fahim', 'President'),
                      MemberInfo('images/members/aziz.jpg', 'Aziz', 'GS'),
                      MemberInfo('images/members/asif.jpg', 'Asif', 'VP'),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
