import 'package:get/state_manager.dart';
import 'package:robbinlaw/models/count.dart';

class CountController extends GetxController {
  Rx<CounterModel> _counterModelStream = Rx<CounterModel>();

  CounterModel get counter => this._counterModelStream.value;

  set counter(CounterModel value) => this._counterModelStream.value = value;

  @override
  onInit() {
    super.onInit();
    print('CountController onInit:');
    _counterModelStream.value = CounterModel();
    _counterModelStream.update((val) {
      val.count = 4;
    });

    /// Called every time the variable $_ is changed
    ever(_counterModelStream, (_) => print("$_ has been changed"));

    /// Called first time the variable $_ is changed
    once(_counterModelStream, (_) => print("$_ was changed once"));
  }

  @override
  void onReady() {
    print(
        'CountController onReady:'); // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    print(
        'CountController onClose:'); // called just before the Controller is deleted
    super.onClose();
  }

  void increment() {
    print('CountController increment:');
    //_counterModelStream.value.count++;
    _counterModelStream.update((val) {
      val.count++;
    });
    print('CountController increment: counter.count = ${counter.count}');
  }
}
