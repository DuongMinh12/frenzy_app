import 'package:flutter/material.dart';
import 'package:frenzy_app/screens/home_screen/home_screen.dart';
import 'package:frenzy_app/screens/login_screen/login_screen.dart';
import 'package:frenzy_app/screens/user/profile_screen.dart';

final Map<String, WidgetBuilder> route={
  LoginScreen.routeName:(context)=> LoginScreen(),
  HomeScreen.routeName: (context)=> HomeScreen(),
  UserProfile.routeName: (context)=> UserProfile(),

};