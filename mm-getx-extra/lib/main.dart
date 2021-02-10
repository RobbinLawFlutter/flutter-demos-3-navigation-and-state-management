import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:robbinlaw/controllers/bindings/sampleBind.dart';
import 'package:robbinlaw/screens/first.dart';
import 'package:robbinlaw/screens/second.dart';
import 'package:robbinlaw/utils/translations.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    // It is not mandatory to use named routes, but dynamic urls are interesting.
    initialRoute: '/first',
    theme: ThemeData(
      accentColor: Colors.purpleAccent,
      primaryColor: Colors.purple,
    ),
    defaultTransition: Transition.upToDown,
    translations: MyTranslations(),
    locale: Locale('en', 'US'),
    getPages: [
      //Simple GetPage
      GetPage(name: '/first', page: () => First()),
      // GetPage with custom transitions and bindings
      GetPage(
        name: '/second',
        page: () => Second(),
        binding: SampleBind(),
      ),
    ],
  ));
}
