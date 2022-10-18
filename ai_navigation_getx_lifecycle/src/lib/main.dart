// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/views/fourth.dart';
import 'package:robbinlaw/views/home.dart';
import 'package:robbinlaw/views/second.dart';
import 'package:robbinlaw/views/third.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeView(),
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeView(),
        ),
        GetPage(
          name: '/second',
          page: () => SecondView(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/third',
          page: () => ThirdView(),
          //transition: Transition.zoom,
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "/fourth",
          page: () => FourthView(),
        ),
      ],
    );
  }
}
