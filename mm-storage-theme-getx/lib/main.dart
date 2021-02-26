import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:robbinlaw/bindings/globalBindings.dart';
import 'package:robbinlaw/views/home.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: GlobalBindings(),
    home: HomeView(),
    theme: ThemeData.dark(),
    defaultTransition: Transition.upToDown,
  ));
}
