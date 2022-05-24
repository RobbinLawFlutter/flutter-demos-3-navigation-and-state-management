import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:robbinlaw/controllers/sumController.dart';

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('second View'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SumController>(
              //You can use bindings instead of init. Bindings are when this widget gets
              //rendered, you can create your Controller
              builder: (_) {
                print("count1 rebuild");
                return Text(
                  'Counter #1:    ${_.counter1.count}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            Text("                        +"),
            GetX<SumController>(
              builder: (_) {
                print("count2 rebuild");
                return Text(
                  'Counter #2:    ${_.counter2.count}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            const Text("                        ="),
            GetX<SumController>(builder: (_) {
              print("sum rebuild");
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
              },
            ),
            ElevatedButton(
              child: const Text("Increment Counter #2"),
              onPressed: () {
                Get.find<SumController>().increment2();
              },
            ),
            ElevatedButton(
              child: const Text("Store Values"),
              onPressed: () {
                print('store values');
                GetStorage box = GetStorage();
                box.write("count1", Get.find<SumController>().counter1.count);
                box.write("count2", Get.find<SumController>().counter2.count);
              },
            ),
            ElevatedButton(
              child: const Text("Un Store Values"),
              onPressed: () {
                print('unstore values');
                GetStorage box = GetStorage();
                box.write("count1", null);
                box.write("count2", null);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text('Go back'),
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
