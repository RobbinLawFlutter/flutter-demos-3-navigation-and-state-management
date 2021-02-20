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
        title: Text("Second View"),
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
                  'Current Counter Value: ${_.counter.count}',
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text("Increment Counter"),
              onPressed: () {
                Get.find<CountController>().increment();
              },
            ),
            SizedBox(
              height: 20,
            ),
            GetX<UserController>(
              initState: (_) {},
              builder: (_) {
                print('SecondView GetX<UserController> builder: ');
                return Column(children: [
                  Text('User Name: ${_.user?.name}'),
                  Text('User Count: ${Get.find<UserController>().user?.count}'),
                ]);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Update User Name & Count"),
              onPressed: () {
                Get.find<UserController>().updateUser(
                    name: 'Second View User Name',
                    count: Get.find<CountController>().counter.count);
              },
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              child: Text('Go to Third View'),
              onPressed: () {
                Get.to(ThirdView());
              },
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
