//getx (navigation manager and state manager) documentation from medium
//https://medium.com/flutter-community/the-flutter-getx-ecosystem-dependency-injection-8e763d0ec6b9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/bindings/globalBindings.dart';
import 'package:robbinlaw/views/home.dart';

import 'package:robbinlaw/demos/ac_tabbed_page_demo_1.dart';
import 'package:robbinlaw/demos/ae_tabbed_page_demo_2.dart';
import 'package:robbinlaw/demos/ag_tabbed_page_demo_3.dart';
import 'package:robbinlaw/demos/aj_scoped_model_demo_1.dart';
import 'package:robbinlaw/demos/ak_scoped_model_demo_2.dart';
import 'package:robbinlaw/demos/ay_AlertDialog_SnackBar_Demo.dart';
import 'package:robbinlaw/demos/am_tabbed_page_scoped_model_demo.dart';

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
      //dependancy injection via Bindings().
      initialBinding: GlobalBindings(),
      //home: HomeView(),
      home: MyTabbedDemo1(),
      // home: MyTabbedDemo2(),
      // home: MyTabbedDemo3(),
      // home: MyScopedModelDemo1(
      //   myModel: MyCounterModel(),
      //),

      // home: MyScopedModelDemo2(),
      // home: MyTabbedScopedModelDemo(),
      //home: AlertDialogAndSnackBarDemo(),
      theme: ThemeData.dark(),
    );
  }
}
