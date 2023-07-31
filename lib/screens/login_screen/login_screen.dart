import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenzy_app/constant/constants.dart';
import 'package:frenzy_app/screens/login_screen/components/widget_login_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String routeName = 'LoginScreen';
  TextEditingController txtname = TextEditingController();
  TextEditingController txtpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(),
       body: Column(
         mainAxisSize: MainAxisSize.min,
         children: [

           //xử lý background
           ClipPath(
             clipper: CustomClip(),
             child: Container(
               height: 320,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage(loginBG),
                   fit: BoxFit.cover
                 )
               ),
             ),
           ),

           //Phần điền form
           widgetFormColumn(context, txtname, txtpass),
           Spacer(),

           //phần chuyển sang trang đăng ký
           buildContainerRegister()
         ],
       ),
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path path = Path();

    path.lineTo(0, 4*(h/5));
    path.cubicTo(0.5*w, h, 2*(w/4), h/2.2, w, 4*(h/5));
    path.lineTo(w, 0); //point 5
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}

