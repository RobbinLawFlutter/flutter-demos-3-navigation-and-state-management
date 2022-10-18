//https://flutterbyexample.com/lesson/stateful-widget-lifecycle

//Statefull Lifecyle by Robert Brunhage
//https://www.youtube.com/watch?v=CjloInz3-I0

// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:robbinlaw/views/third.dart';
import 'package:robbinlaw/views/fourth.dart';
import 'package:robbinlaw/constants.dart';

class SecondView extends StatefulWidget {
  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  String dataFromFourth = "0";

  @override
  void initState() {
    super.initState();
    print('SecondView initState');
  }

  @override
  void deactivate() {
    print('SecondView deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('SecondView dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Second View"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                "View3 via Get.to",
                style: kTextStyle,
              ),
              onPressed: () {
                Get.to(ThirdView());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "View3 via Get.toNamed",
                style: kTextStyle,
              ),
              onPressed: () {
                Get.toNamed("/third");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "View3 remove this view",
                style: kTextStyle,
              ),
              onPressed: () => Get.off(ThirdView()),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "View3 remove all views",
                style: kTextStyle,
              ),
              onPressed: () => Get.offAll(ThirdView()),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text(
                "View4 via Get.to with parm",
                style: kTextStyle,
              ),
              onPressed: () {
                Get.to(FourthView(), arguments: "View2 parm via Get.to");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "View4 via Get.toNamed w/parm",
                style: kTextStyle,
              ),
              onPressed: () {
                Get.toNamed("/fourth", arguments: "View2 parm via Get.toNamed");
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Data From Fourth View: " + dataFromFourth,
              style: kTextStyle,
            ),
            ElevatedButton(
              child: const Text(
                "Return Data from Fourth View",
                style: kTextStyle,
              ),
              onPressed: () async {
                dataFromFourth = await Get.to(FourthView());
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                'Go to Previous View',
                style: kTextStyle,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
