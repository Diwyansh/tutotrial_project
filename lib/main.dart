import 'package:ecommerce_project/features/auth/login_screen.dart';
import 'package:ecommerce_project/features/dashboard/dashboard.dart';
import 'package:ecommerce_project/features/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      routes: {
        "dashboard" : (context) => Dashboard(),
        "signIn" : (context) => SignInPage(),
      },
    );
  }
}


