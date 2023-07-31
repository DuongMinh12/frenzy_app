import 'package:flutter/material.dart';
import 'package:frenzy_app/routes.dart';
import 'package:frenzy_app/screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: route,
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
    );
  }
}
