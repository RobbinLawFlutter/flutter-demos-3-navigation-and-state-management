// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:robbinlaw/constants.dart';

class FourthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth View"),
        centerTitle: true,
      ),
      body: Center(
        child: (Get.arguments != null)
            ? Text(
                Get.arguments,
                style: kTextStyle,
              )
            : Column(
                children: <Widget>[
                  ElevatedButton(
                    child: const Text(
                      "Return Text 'hello'",
                      style: kTextStyle,
                    ),
                    onPressed: () {
                      Get.back(result: "hello");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Return Text 'world'",
                      style: kTextStyle,
                    ),
                    onPressed: () {
                      Get.back(result: "world");
                    },
                  )
                ],
              ),
      ),
    );
  }
}
