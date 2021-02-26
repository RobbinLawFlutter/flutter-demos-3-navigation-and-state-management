import 'package:get/state_manager.dart';
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
    _counterStream1.value = CounterModel();
    _counterStream1.update((val) {
      val.count = 0;
    });
    _counterStream2.value = CounterModel();
    _counterStream2.update((val) {
      val.count = 0;
    });

    /// Called every time the variable $_ is changed
    ever(_counterStream1, (_) => print("_counterStream1 has been changed"));

    /// Called first time the variable $_ is changed
    once(_counterStream1, (_) => print("_counterStream1 was changed once"));

    /// Called once there has been no action on observable for 1 second
    debounce(_counterStream1, (_) => print("debouce _counterStream1"),
        time: Duration(seconds: 1));

    /// Only reads the observable every 1 second
    interval(_counterStream1, (_) => print("interval _counterStream1"),
        time: Duration(seconds: 1));
  }

  @override
  void onReady() {
    print(
        'SumController onReady:'); // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    print(
        'SumController onClose:'); // called just before the Controller is deleted
    super.onClose();
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
