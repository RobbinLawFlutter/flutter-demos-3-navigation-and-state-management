import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:robbinlaw/models/count.dart';

class SumController extends GetxController {
  Rx<CounterModel> _counterStream1 = Rx<CounterModel>();
  CounterModel get counter1 => this._counterStream1.value;
  set counter1(CounterModel value) => this._counterStream1.value = value;
  Rx<CounterModel> _counterStream2 = Rx<CounterModel>();
  CounterModel get counter2 => this._counterStream2.value;
  set counter2(CounterModel value) => this._counterStream2.value = value;
  int get sum {
    if (counter1 == null || counter2 == null)
      return 0;
    else
      return counter1.count + counter2.count;
  }

  @override
  onInit() {
    super.onInit();
    print('SumController onInit:');
    GetStorage box = GetStorage();
    _counterStream1.value = CounterModel();
    _counterStream1.update((val) {
      if (box.read("count1") != null) {
        val.count = box.read("count1");
      } else {
        val.count = 0;
      }
    });
    _counterStream2.value = CounterModel();
    _counterStream2.update((val) {
      if (box.read("count2") != null) {
        val.count = box.read("count2");
      } else {
        val.count = 0;
      }
    });
  }

  void increment1() {
    print('SumController increment1:');
    _counterStream1.update((val) {
      val.count++;
    });
    print('SumController increment1: counter.count = ${counter1.count}');
  }

  void increment2() {
    print('SumController increment2:');
    _counterStream2.update((val) {
      val.count++;
    });
    print('SumController increment2: counter.count = ${counter2.count}');
  }
}
