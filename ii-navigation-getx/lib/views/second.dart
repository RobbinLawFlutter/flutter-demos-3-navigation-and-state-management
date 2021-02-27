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
        title: Text("Second View"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text(
                  "Go to Third View but do not remove this view from stack"),
              onPressed: () => Get.to(ThirdView()),
            ),
            ElevatedButton(
              child: Text("Go to Third View and remove this view from stack"),
              onPressed: () => Get.off(ThirdView()),
            ),
            ElevatedButton(
              child: Text("Go To Third View and remove everything from stack"),
              onPressed: () => Get.offAll(ThirdView()),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                child: Text("Go to Fourth View via Get.to with parameter"),
                onPressed: () {
                  Get.to(FourthView(),
                      arguments: "Passed From Second View via Get.to");
                }),
            ElevatedButton(
                child: Text("Go to Fourth View via Get.toNamed with parameter"),
                onPressed: () {
                  Get.toNamed("/fourth",
                      arguments: "Passed From Second View via Get.toNamed");
                }),
            SizedBox(
              height: 40,
            ),
            Text("Data From Fourth View: " + dataFromFourth),
            ElevatedButton(
              child: Text("Return Data from Fourth View"),
              onPressed: () async {
                dataFromFourth = await Get.to(FourthView());
                setState(() {});
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Go to Previous View'),
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
