import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../ui/search_foods.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SearchFoods()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/icon.png', width: 100.0, height: 100.0),
      ),
    );
  }
}
