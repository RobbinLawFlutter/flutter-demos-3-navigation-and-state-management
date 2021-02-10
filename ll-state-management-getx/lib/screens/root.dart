import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/controllers/countController.dart';
import 'package:robbinlaw/controllers/userController.dart';
import 'package:robbinlaw/screens/second.dart';

class Root extends StatelessWidget {
  //final CountController countController = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX | State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<CountController>(
              initState: (_) {},
              builder: (s) => Text(
                'Current Count Value: ${s.count}',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GetX<UserController>(
              initState: (_) {},
              //UserController(), // can initialize inside GetX instead of .put
              builder: (_) => Text('Name: ${_.user.value.name}'),
            ),
            GetX<CountController>(
              initState: (_) {},
              builder: (_) => Text(
                  'Stored Count: ${Get.find<UserController>().user.value.count}'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Update Name & Stored Count"),
              onPressed: () {
                Get.find<UserController>().updateUser(Get.find<
                        CountController>()
                    .count); //using Get.find locates the controller that was created in 'init' in GetX
              },
            ),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              child: Text('Next Screen'),
              onPressed: () {
                Get.to(Second());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.find<CountController>().increment();
          }),
    );
  }
}
