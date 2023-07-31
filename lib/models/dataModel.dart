import 'package:flutter/material.dart';
import 'package:frenzy_app/screens/login_screen/login_screen.dart';
import 'package:frenzy_app/screens/user/profile_screen.dart';
//
import '../constant/constants.dart';

class IconDrawer{
  IconData icon;
  String title;
  IconDrawer({required this.title, required this.icon, required this.route});
  String route;

  static List <IconDrawer> tapDrawer = [
    IconDrawer(title: 'Home', icon: Icons.home, route: ''),
    IconDrawer(title: 'Chat', icon: Icons.chat, route: ''),
    IconDrawer(title: 'Map', icon: Icons.pin_drop, route: ''),
    IconDrawer(title: 'Your Profile', icon: Icons.person, route: UserProfile.routeName),
    IconDrawer(title: 'Settings', icon: Icons.settings, route: ''),
    IconDrawer(title: 'Logout', icon: Icons.logout, route: LoginScreen.routeName),
  ];

 // IconDrawer cus =  IconDrawer(title: 'Home', icon: Icons.home, route: '');
}