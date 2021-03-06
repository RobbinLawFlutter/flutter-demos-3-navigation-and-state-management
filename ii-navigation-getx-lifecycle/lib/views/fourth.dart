import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FourthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth View"),
        centerTitle: true,
      ),
      body: Center(
        child: (Get.arguments != null)
            ? Text(Get.arguments)
            : Column(
                children: <Widget>[
                  ElevatedButton(
                    child: Text("Return Text 'hello'"),
                    onPressed: () {
                      Get.back(result: "hello");
                    },
                  ),
                  ElevatedButton(
                    child: Text("Return Text 'world'"),
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
