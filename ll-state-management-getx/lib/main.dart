//getx (navigation manager and state manager) documentation from medium
//https://medium.com/flutter-community/the-flutter-getx-ecosystem-dependency-injection-8e763d0ec6b9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/bindings/globalBindings.dart';
import 'package:robbinlaw/views/home.dart';

//don't need 'Get' before Material App if you're only using State Management
//but we will also use Get for Navigation Management so we will need it.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.upToDown,
      //dependancy injection via Bindings().
      initialBinding: GlobalBindings(),
      home: HomeView(),
      theme: ThemeData.dark(),
    );
  }
}
