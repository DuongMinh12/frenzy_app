import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenzy_app/screens/home_screen/home_screen.dart';

import '../../../constant/constants.dart';

Padding widgetFormColumn(BuildContext context, TextEditingController txtname, TextEditingController txtpass) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      children: [
        Text('F R E N Z Y', style: txt35wB,),
        SizedBox(height: 15,),
        TextField(
          controller: txtname,
          decoration: InputDecoration(
            prefixIcon: Icon(CupertinoIcons.person_crop_rectangle_fill, size: 25,),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Username',
            hintStyle: TextStyle(fontSize: 18),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
        SizedBox(height: 25,),
        TextField(
          controller: txtpass,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, size: 25,),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Password',
            hintStyle: TextStyle(fontSize: 18),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
        SizedBox(height: 45,),
        ElevatedButton(onPressed: (){
          // if(txtname.text=='admin' && txtpass.text=='123456'){
          //   Navigator.pushNamed(context, HomeScreen.routeName);
          // }
          // else{
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Kiểm tra lại tải khoản hoặc mật khẩu')));
          // }
          Navigator.pushNamed(context, HomeScreen.routeName);
        }, child: Text('Login', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
              minimumSize: Size(300, 45),
              backgroundColor: kMain
          ),)
      ],
    ),
  );
}

Container buildContainerRegister() {
  return Container(
    alignment: Alignment.center,
    height: 75,
    color: kMain,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?', style: txt20,),
        TextButton(onPressed: (){}, child: Text('Sign up', style: txt20,))
      ],
    ),
  );
}