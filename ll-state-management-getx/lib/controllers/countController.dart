import 'package:get/state_manager.dart';
import 'package:robbinlaw/models/count.dart';

class CountController extends GetxController {
  CounterModel _counterModel = CounterModel();
  int get count => _counterModel.count;
  void increment() {
    _counterModel.increment();
  }
}
