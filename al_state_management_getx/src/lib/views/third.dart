// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/controllers/sumController.dart';

class ThirdView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third View'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SumController>(
              builder: (_) {
                print("ThirdView GetX<SumController> 1 builder:");
                return Text(
                  'Counter #1:    ${_.counter1.count}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            const Text("                        +"),
            GetX<SumController>(
              builder: (_) {
                print("ThirdView GetX<SumController> 2 builder:");
                return Text(
                  'Counter #2:    ${_.counter2.count}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            const Text("                        ="),
            GetX<SumController>(builder: (_) {
              print("ThirdView GetX<SumController> 3 builder:");
              return Text(
                'Sum:                 ${_.sum}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text("Increment Counter #1"),
              onPressed: () {
                Get.find<SumController>().increment1();
                //_.increment();
              },
            ),
            ElevatedButton(
              child: const Text("Increment Counter #2"),
              onPressed: () {
                Get.find<SumController>().increment2();
                //_.increment2();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text('Go to Previous View'),
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
