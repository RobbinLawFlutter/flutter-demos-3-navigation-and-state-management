import 'package:get/state_manager.dart';
import 'package:robbinlaw/models/count.dart';

class SumController extends GetxController {
  Rx<CounterModel> _counter1 = Rx<CounterModel>();
  CounterModel get counter1 => this._counter1.value;
  set counter1(CounterModel value) => this._counter1.value = value;
  Rx<CounterModel> _counter2 = Rx<CounterModel>();
  CounterModel get counter2 => this._counter2.value;
  set counter2(CounterModel value) => this._counter2.value = value;
  int get sum => counter1.count + counter2.count;

  increment() => counter1.count++;

  increment2() => counter2.count++;

  /// Once the controller has entered memory, onInit will be called.
  /// It is preferable to use onInit instead of class constructors or initState method.
  /// Use onInit to trigger initial events like API searches, listeners registration
  /// or Workers registration.
  /// Workers are event handlers, they do not modify the final result,
  /// but it allows you to listen to an event and trigger customized actions.
  /// Here is an outline of how you can use them:
  @override
  onInit() {
    /// Called every time the variable $_ is changed
    ever(_counter1, (_) => print("$_ has been changed"));

    /// Called first time the variable $_ is changed
    once(_counter1, (_) => print("$_ was changed once"));

    /// Called once there has been no action on observable for 1 second
    debounce(_counter1, (_) => print("debouce$_"), time: Duration(seconds: 1));

    /// Only reads the observable every 1 second
    interval(_counter1, (_) => print("interval $_"),
        time: Duration(seconds: 1));
  }
}
