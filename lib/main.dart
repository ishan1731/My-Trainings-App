import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/view/home_page2.dart';
import 'view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Trainings App',
      home: HomePageA(),     // its your design
     //  home: HomePage(),    // its my side design
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
