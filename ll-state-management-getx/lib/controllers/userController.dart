import 'package:get/get.dart';
import 'package:robbinlaw/models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _userStream = Rx<UserModel>();
  UserModel get user => _userStream.value;
  set user(UserModel value) => _userStream.value = value;

  @override
  onInit() {
    super.onInit();
    print('UserController onInit:');
    user = UserModel();

    /// Called every time the variable $_ is changed
    ever(_userStream, (_) => print("$_ has been changed"));

    /// Called first time the variable $_ is changed
    once(_userStream, (_) => print("$_ was changed once"));
  }

  void updateUser(int count) {
    print('UserController updateUser:');
    user.name = "Robbin";
    user.count = count;
  }
}
