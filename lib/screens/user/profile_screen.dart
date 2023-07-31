import 'package:flutter/material.dart';
import 'package:frenzy_app/constant/constants.dart';
import 'package:frenzy_app/models/data.dart';
import 'package:frenzy_app/screens/home_screen/components/drawer_body.dart';
import 'package:frenzy_app/screens/login_screen/login_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'components/pro5_widget.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);
  static String routeName = 'UserProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //phần background + avatar
          buildStackProfile(context),
          SizedBox(height: 15,),
          Center(child: Text(currentUser.name, style: txt26w5,)),

          // phần following, tạo 1 widget chung,
          // sau mỗi lần thay đổi design thì chỉ cần thay đổi 1 lần,
          // cả following và followers sẽ thay đổi cùng nhau
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildColumnFollow('Following', currentUser.following),
                buildColumnFollow('Followers', currentUser.followers)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Your Post', style: txt26w5,),
          ),
          SizedBox(height: 10,),

          //dùng lại CarouselSlider của home_screen, truyền data từ currentUser.post
          CarouselSlider(
            items: currentUser.posts
                .map((e) => buildClipRRectCarouselSlider(e.imageUrl,
                e.title, e.location, e.likes, e.comments))
                .toList(),
            options: CarouselOptions(
              enlargeFactor: 0.25,
              viewportFraction: 0.76,
              aspectRatio: 2.0,
              height: 340,
              enlargeCenterPage: true,
              //autoPlay: true,
            ),
          ),
        ],
      ),
    );
  }



}


