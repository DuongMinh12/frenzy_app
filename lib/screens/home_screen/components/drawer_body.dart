import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenzy_app/models/data.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../../constant/constants.dart';
import '../../../models/dataModel.dart';


//Mỗi 1 widget (ví dụ: home_screen_1, buildDrawerHeader,...)
// phần nào liên quan nhau sẽ được đưa vào 1 file chung,
// nhưng tui lười nên nhét hết ở file drawer_body

//body Trending screen
Container home_screen_1() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildPaddingText('Following'),
        Container(
          height: 70,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: users.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    radius: 28,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage(users[index].profileImageUrl),
                    ),
                  ),
                );
              }),
        ),
        buildPaddingText('Posts'),
        CarouselSlider(
          items: posts
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

//Phần menu, menu header bao gồm background, avatar, tên user
DrawerHeader buildDrawerHeader() {
  return DrawerHeader(
      padding: EdgeInsets.zero,
      //margin: EdgeInsets.zero,
      child: Stack(
        children: [
          Container(
            child: Image.asset(
              userBG,
              fit: BoxFit.cover,
            ),
            width: double.infinity,
          ),
          Positioned(
            child: CircleAvatar(
              radius: 50,
              child:
                  CircleAvatar(radius: 48, backgroundImage: AssetImage(currentUser.profileImageUrl)),
            ),
            bottom: 15,
            left: 15,
          ),
          Positioned(
              bottom: 15,
              left: 130,
              child: Text(
                '${currentUser.name}',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ));
}

//Phần chuyển trang của menu
Widget buildListTile_drawer(BuildContext context) {
  return Expanded(
    child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: IconDrawer.tapDrawer.length,
        itemBuilder: (context, indext) {
          return ListTile(
            title: Text(
              IconDrawer.tapDrawer[indext].title,
              style: txt20!.copyWith(color: Colors.black),
            ),
            leading: Icon(IconDrawer.tapDrawer[indext].icon),
            onTap: () {
              Navigator.pushNamed(context, IconDrawer.tapDrawer[indext].route);
            },
          );
        }),
  );
}

//Body trending: phần trình chiếu slide ảnh
ClipRRect buildClipRRectCarouselSlider(
    String image, String imagetitle, String local, int like, int cmt) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: 340,
          width: 270,
        ),
        Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white.withAlpha(150),
              height: 100,
              width: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(imagetitle, style: txt18wbold,),
                  Text(local, style: txt18wbold!.copyWith(fontSize: 15),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(CupertinoIcons.heart_fill, color: Colors.red,),
                          SizedBox(width: 5,),
                          Text('$like', style: txt16,),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.chat, color: kMain,),
                          SizedBox(width: 5,),
                          Text('$cmt', style: txt16,),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ))
      ],
    ),
  );
}

Padding buildPaddingText(String title) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
      title,
      style: txt20!.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
    ),
  );
}


