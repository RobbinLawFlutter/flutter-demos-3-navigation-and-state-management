import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:robbinlaw/views/third.dart';
import 'package:robbinlaw/views/fourth.dart';

class SecondView extends StatefulWidget {
  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  String dataFromFourth = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Go to Third and remove this screen from stack"),
              onPressed: () => Get.off(ThirdView()),
            ),
            ElevatedButton(
              child: Text("Go To Third and remove everything from stack"),
              onPressed: () => Get.offAll(ThirdView()),
            ),
            SizedBox(
              height: 100,
            ),
            Text("Data From Fourth Screen: " + dataFromFourth),
            ElevatedButton(
              child: Text("Return Data from Fourth Screen"),
              onPressed: () async {
                dataFromFourth = await Get.to(FourthView());
                setState(() {});
              },
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                child: Text("Go to Named /fourth with parameter"),
                onPressed: () {
                  Get.toNamed("/fourth", arguments: "Passed From Second");
                }),
          ],
        ),
      ),
    );
  }
}
