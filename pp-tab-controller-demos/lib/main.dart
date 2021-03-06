import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:robbinlaw/demos/aa-tab-demo-1.dart';
import 'package:robbinlaw/demos/cc-tab-demo-2.dart';
import 'package:robbinlaw/demos/dd-tab-demo-3.dart';
import 'package:robbinlaw/demos/ff-dialog-snackbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MyTabbedDemo1(),
      //home: MyTabbedDemo2(),
      //home: MyTabbedDemo3(),
      home: AlertDialogAndSnackBarDemo(),
      theme: ThemeData.dark(),
    );
  }
}
