// ignore_for_file: avoid_print, file_names

import 'package:get/get.dart';
import 'package:robbinlaw/models/user.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userStream = Rx<UserModel>(UserModel(name: "", count: 0));
  
  UserModel get user => _userStream.value;
  set user(UserModel value) => _userStream.value = value;

  @override
  onInit() {
    super.onInit();
    print('UserController onInit:');
    _userStream.value = UserModel(name: "", count: 0);
    _userStream.update((val) {
      val!.name = 'OnInit User Name';
      val.count = 0;
    });

    // Called every time the userStream is changed
    ever(_userStream, (_) => print("_userStream has been changed"));

    // Called first time the userStream is changed
    once(_userStream, (_) => print("_userStream was changed once"));
  }

  // called after the widget is rendered on screen
  @override
  void onReady() {
    print('UserController onReady:');
    super.onReady();
  }

  // called just before the Controller is deleted
  @override
  void onClose() {
    print('UserController onClose:');
    super.onClose();
  }

  void updateUser({required String name, required int count}) {
    print('UserController updateUser:');
    _userStream.update((val) {
      val!.name = name;
      val.count = count;
    });
  }
}
