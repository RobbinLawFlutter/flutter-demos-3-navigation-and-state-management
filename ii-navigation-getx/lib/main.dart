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
      theme: ThemeData(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeView(),
        ),
        GetPage(
          name: '/second',
          page: () => SecondView(),
        ),
        GetPage(
          name: '/third',
          page: () => ThirdView(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: "/fourth",
          page: () => FourthView(),
        ),
      ],
    );
  }
}
