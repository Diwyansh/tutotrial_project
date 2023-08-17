import 'dart:async';

import 'package:ecommerce_project/features/preview_screen.dart';
import 'package:ecommerce_project/main.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 3),() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const PreviewScreen()));
    });

    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/icons/logo.png"),
      ),
    );
  }
}
