import 'package:get/get.dart';
import 'package:robbinlaw/controllers/countController.dart';
import 'package:robbinlaw/controllers/sumController.dart';

//This GlobalBindings class that inherits (extends) from Bindings from the Getx library
//will instanciate all controllers (allocating permanent memory) and making
//them available anywhere in the app via Get.find until the app is terminated.
//This is commonly called global dependency injection.
//It allows us to separate out the dependency injection from the views/routes.
class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(() => CountController());
    Get.put<CountController>(CountController(), permanent: true);
    //Get.lazyPut(() => SumController());
    Get.put<SumController>(SumController(), permanent: true);
  }
}
