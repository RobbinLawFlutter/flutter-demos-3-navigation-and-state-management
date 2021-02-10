import 'package:get/state_manager.dart';
import 'package:robbinlaw/models/count.dart';

class CountController extends GetxController {
  Rx<CounterModel> _counterModelStream = Rx<CounterModel>();
  int get count => _counterModelStream.value.count;
  void increment() {
    _counterModelStream.value.increment();
  }
}
