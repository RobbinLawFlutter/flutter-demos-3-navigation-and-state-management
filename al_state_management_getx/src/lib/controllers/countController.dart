//Dart getters and setters by geekforgeeks.
//https://www.geeksforgeeks.org/getter-and-setter-methods-in-dart/

//Dart getters and setters by dart.dev.
//https://dart.dev/guides/language/language-tour#getters-and-setters

//GetX docs on pub.dev
//https://pub.dev/packages/get

// ignore_for_file: file_names, avoid_print

import 'package:get/state_manager.dart';
import 'package:robbinlaw/models/count.dart';

class CountController extends GetxController {
  //Creating a stream of data events of type CounterModel.
  final Rx<CounterModel> _counterModelStream = Rx<CounterModel>(CounterModel(count: 0));
  //Darts way of creating a getter for a public property.
  CounterModel get counter => _counterModelStream.value;
  //Darts way of creating a setter for a public property.
  set counter(CounterModel value) => _counterModelStream.value = value;

  @override
  onInit() {
    super.onInit();
    print('CountController onInit:');
    _counterModelStream.value = CounterModel(count: 0);
    _counterModelStream.update((val) {
      val!.count = 0;
    });

    //Called every time the stream is changed
    ever(_counterModelStream,
        (_) => print("_counterModelStream has been changed"));

    //Called first time the stream is changed
    once(_counterModelStream,
        (_) => print("_counterModelStream was changed once"));
  }

  // called after the widget is rendered on screen
  @override
  void onReady() {
    print('CountController onReady:');
    super.onReady();
  }

  // called just before the Controller is deleted
  @override
  void onClose() {
    print('CountController onClose:');
    super.onClose();
  }

  void increment() {
    print('CountController increment:');
    //_counterModelStream.value.count++;
    _counterModelStream.update((val) {
      val!.count++;
    });
    print('CountController increment: counter.count = ${counter.count}');
  }
}
