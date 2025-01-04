import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Trainings App',
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
