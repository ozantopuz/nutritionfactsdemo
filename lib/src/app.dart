import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ui/splash.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nutrition Facts',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.black,
          accentColor: Colors.white,
        ),
        home: Splash());
  }
}
