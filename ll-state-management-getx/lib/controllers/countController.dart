//Dart getters and setters by geekforgeeks.
//https://www.geeksforgeeks.org/getter-and-setter-methods-in-dart/

//Dart getters and setters by dart.dev.
//https://dart.dev/guides/language/language-tour#getters-and-setters

import 'package:get/state_manager.dart';
import 'package:robbinlaw/models/count.dart';

class CountController extends GetxController {
  //Creating a stream of data events of type CounterModel.
  Rx<CounterModel> _counterModelStream = Rx<CounterModel>();
  //Darts way of creating a getter for a public property.
  CounterModel get counter => this._counterModelStream.value;
  //Darts way of creating a setter for a public property.
  set counter(CounterModel value) => this._counterModelStream.value = value;

  @override
  onInit() {
    super.onInit();
    print('CountController onInit:');
    _counterModelStream.value = CounterModel();
    _counterModelStream.update((val) {
      val.count = 0;
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
