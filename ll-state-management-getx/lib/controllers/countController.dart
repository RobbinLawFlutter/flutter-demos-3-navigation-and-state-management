import 'package:get/state_manager.dart';
import 'package:robbinlaw/models/count.dart';

class CountController extends GetxController {
  Rx<CounterModel> _counterModel = Rx<CounterModel>();

  CounterModel get counter => _counterModel.value;

  set counter(CounterModel value) => this._counterModel.value = value;

  void increment() {
    counter.count++;
  }
}
