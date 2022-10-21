// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/controllers/countController.dart';
import 'package:robbinlaw/controllers/userController.dart';
import 'package:robbinlaw/controllers/sumController.dart';
import 'package:robbinlaw/views/second.dart';
import 'package:robbinlaw/views/third.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('HomeView build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX | Home View"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<CountController>(
              initState: (_) {},
              builder: (_) {
                print('HomeView GetX<CountController> 1 builder: ');
                return Text(
                  'Counter #0:    ${_.counter.count}',
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
                print('HomeView GetX<UserController> 1 builder: ');
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
                    name: 'Home View User Name',
                    count: Get.find<CountController>().counter.count);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text('Go to Second View'),
              onPressed: () {
                Get.to(SecondView());
              },
            ),
            const SizedBox(
              height: 40,
            ),
            GetX<SumController>(
              initState: (_) {},
              builder: (_) {
                print('HomeView GetX<SumController> 1 builder: ');
                return Column(children: [
                  Text('ThirdView Sum:   ${_.sum}'),
                ]);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text('Go to Third View'),
              onPressed: () {
                Get.to(ThirdView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
