import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/info_text.dart';
import '../../../const/main_colors.dart';
import '../../../widgets/button.dart';
import '../../../widgets/club_members.dart';
import '../../../widgets/info_text_style.dart';

class SportsClub extends StatefulWidget {
  const SportsClub({Key? key}) : super(key: key);

  @override
  State<SportsClub> createState() => _SportsClubState();
}

class _SportsClubState extends State<SportsClub> {
  List imageList = [
    {"id": 1, "image_path": 'images/lusc/lusc1.jpg'},
    {"id": 2, "image_path": 'images/lusc/lusc2.jpg'},
    {"id": 3, "image_path": 'images/lusc/lusc3.jpg'}
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
                //Navigator.push(context, CupertinoPageRoute(builder: (_) => LuccReg()));
              }),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Leading University Sports Club',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              InfoTextStyle(InfoText().lusc),
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
                      MemberInfo('images/lusc/lusc_members/mahbub_sir.jpg', 'Md. Mahbubur Rahaman', 'Advisor'),
                      MemberInfo('images/lusc/lusc_members/juha_vai.jpg', 'Mosharul Islam Juha', 'President'),
                      MemberInfo('images/lusc/lusc_members/rahat_vai.jpg', 'Rahat Uddin', 'GS'),
                      MemberInfo('images/lusc/lusc_members/mazhar_vai.jpg', 'Mazharul Islam', 'JGS'),
                      MemberInfo('images/lusc/lusc_members/fahim_vai.jpg', 'Fahim Ahmed', 'VP'),
                      MemberInfo('images/lusc/lusc_members/arif.jpg', 'Arif Sikdar', 'Treasurer'),
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
