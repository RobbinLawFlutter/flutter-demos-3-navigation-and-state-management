import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:robbinlaw/controllers/sumController.dart';

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second View'),
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
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            Text("                        +"),
            GetX<SumController>(
              builder: (_) {
                print("count2 rebuild");
                return Text(
                  'Counter #2:    ${_.counter2.count}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            Text("                        ="),
            GetX<SumController>(builder: (_) {
              print("sum rebuild");
              return Text(
                'Sum:                 ${_.sum}',
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text("Increment Counter #1"),
              onPressed: () {
                Get.find<SumController>().increment1();
              },
            ),
            RaisedButton(
              child: Text("Increment Counter #2"),
              onPressed: () {
                Get.find<SumController>().increment2();
              },
            ),
            RaisedButton(
              child: Text("Store Values"),
              onPressed: () {
                GetStorage box = GetStorage();
                box.write("count1", Get.find<SumController>().counter1.count);
                box.write("count2", Get.find<SumController>().counter2.count);
              },
            ),
            RaisedButton(
              child: Text("Un Store Values"),
              onPressed: () {
                GetStorage box = GetStorage();
                box.write("count1", null);
                box.write("count2", null);
              },
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text('Go back'),
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
