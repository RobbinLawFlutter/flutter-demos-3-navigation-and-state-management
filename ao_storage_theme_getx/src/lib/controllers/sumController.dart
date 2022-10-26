// ignore_for_file: avoid_print

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:robbinlaw/models/count.dart';

class SumController extends GetxController {
  final Rx<CounterModel> _counterStream1 = Rx<CounterModel>(CounterModel(count: 0));
  CounterModel get counter1 => _counterStream1.value;
  set counter1(CounterModel value) => _counterStream1.value = value;
  final Rx<CounterModel> _counterStream2 = Rx<CounterModel>(CounterModel(count: 0));
  CounterModel get counter2 => _counterStream2.value;
  set counter2(CounterModel value) => _counterStream2.value = value;
  int get sum {
      return counter1.count + counter2.count;
  }

  @override
  onInit() {
    super.onInit();
    print('SumController onInit:');

    GetStorage box = GetStorage();

    //_counterStream1.value = CounterModel(count: 0);
    _counterStream1.update((val) {
      if (box.read("count1") != null) {
        val!.count = box.read("count1");
      } else {
        val!.count = 0;
      }
    });

    //_counterStream2.value = CounterModel(count: 0);
    _counterStream2.update((val) {
      if (box.read("count2") != null) {
        val!.count = box.read("count2");
      } else {
        val!.count = 0;
      }
    });

    // Called every time the counterStream is changed
    ever(_counterStream1, (_) => print("_counterStream1 has been changed"));

    // Called first time the counterStream is changed
    once(_counterStream1, (_) => print("_counterStream1 was changed once"));

    // Called once there has been no action on observable for 1 second
    debounce(_counterStream1, (_) => print("debouce _counterStream1"),
        time: Duration(seconds: 1));

    // Only reads the observable every 1 second
    interval(_counterStream1, (_) => print("interval _counterStream1"),
        time: Duration(seconds: 1));
  }

  // called after the widget is rendered on screen
  @override
  void onReady() {
    print(
        'SumController onReady:');
    super.onReady();
  }

  // called just before the Controller is deleted
  @override
  void onClose() {
    print(
        'SumController onClose:');
    super.onClose();
  }

  void increment1() {
    print('SumController increment1:');
    _counterStream1.update((val) {
      val!.count++;
    });
    print('SumController increment1: counter.count = ${counter1.count}');
  }

  void increment2() {
    print('SumController increment2:');
    _counterStream2.update((val) {
      val!.count++;
    });
    print('SumController increment2: counter.count = ${counter2.count}');
  }
}
