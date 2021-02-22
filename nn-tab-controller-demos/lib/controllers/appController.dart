import 'package:get/state_manager.dart';
import 'package:robbinlaw/models/numberModel.dart';
import 'package:robbinlaw/models/numberTypes.dart';

class AppController extends GetxController {
  Rx<List<NumberModel>> _appStream = Rx<List<NumberModel>>();

  List<NumberModel> get numberType => this._appStream.value;

  set numberType(List<NumberModel> value) => this._appStream.value = value;

  @override
  onInit() {
    super.onInit();
    _appStream.value = oneTypes;
    print(
        'AppController onInit: stream.value[0].title = ${_appStream.value[0].title}');

    /// Called every time the variable $_ is changed
    ever(_appStream, (_) => print("stream has been changed"));

    /// Called first time the variable $_ is changed
    once(_appStream, (_) => print("stream was changed once"));
  }

  @override
  void onReady() {
    print('AppController onReady:');
    super.onReady();
  }

  @override
  void onClose() {
    print('AppController onClose:');
    super.onClose();
  }

  void updateDrinksListType(List<NumberModel> numberListType) {
    _appStream.value = numberListType;
    print(
        'AppController updateDrinksList: stream.value[0].title = ${_appStream.value[0].title}');
  }
}
