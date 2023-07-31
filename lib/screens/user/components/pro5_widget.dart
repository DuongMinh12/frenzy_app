import 'package:flutter/material.dart';
import 'package:frenzy_app/screens/home_screen/home_screen.dart';

import '../../../constant/constants.dart';
import '../../../models/data.dart';
import '../../login_screen/login_screen.dart';

Stack buildStackProfile(BuildContext context) {
  return Stack(
    children: [
      ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(99), bottomRight: Radius.circular(50)),
              image: DecorationImage(
                  image: AssetImage(
                    userBG,
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 15),
            child: Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                 // Navigator.pushNamed(context, LoginScreen.routeName);
                  //Navigator.pop(context);
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: Icon(
                  Icons.menu,
                  color: kMain,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 0,
          left: MediaQuery.of(context).size.width * 0.39,
          child: Container(
            decoration:
            BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 5,
                  //spreadRadius: 2,
                  offset: Offset(0, 5))
            ]),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(currentUser.profileImageUrl),
            ),
          ))
    ],
  );
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();

    path.lineTo(0, h / 1.2);
    path.quadraticBezierTo(w / 2, h, w, h / 1.2);
    //path.lineTo(w*0.5, h, 0, h);//point 2
    // path.lineTo(w, h);
    path.lineTo(w, 0); //point 5
    // path.close(); //point 1

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    // throw UnimplementedError();
    return true;
  }
}

Column buildColumnFollow(String title, int fl) {
  return Column(
    children: [
      Text(title, style: txt20!.copyWith(color: Colors.grey.shade600,),),
      Text('${fl}', style: TextStyle(fontSize: 20, fontWeight:FontWeight.w500),),
    ],
  );
}