// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/controllers/countController.dart';
import 'package:robbinlaw/controllers/userController.dart';
import 'package:robbinlaw/views/third.dart';

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('SecondView build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second View"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<CountController>(
              initState: (_) {},
              builder: (_) {
                print('SecondView GetX<CountController> builder: ');
                return Text(
                  'Counter #0:   ${_.counter.count}',
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text("Increment Counter"),
              onPressed: () {
                Get.find<CountController>().increment();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            GetX<UserController>(
              initState: (_) {},
              builder: (_) {
                print('SecondView GetX<UserController> builder: ');
                return Column(children: [
                  Text('User Name:   ${_.user.name}'),
                  Text(
                      'User Count:   ${Get.find<UserController>().user.count}'),
                ]);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text("Update User Name & Count"),
              onPressed: () {
                Get.find<UserController>().updateUser(
                    name: 'Second View User Name',
                    count: Get.find<CountController>().counter.count);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text('Go to Third View'),
              onPressed: () {
                Get.to(ThirdView());
              },
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
