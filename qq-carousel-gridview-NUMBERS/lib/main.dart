//getx (navigation manager and state manager) documentation from medium
//https://medium.com/flutter-community/the-flutter-getx-ecosystem-dependency-injection-8e763d0ec6b9

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/bindings/globalBindings.dart';
import 'package:robbinlaw/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //dependancy injection via Bindings().
      initialBinding: GlobalBindings(),
      home: HomeView(),
      theme: ThemeData.dark(),
    );
  }
}
