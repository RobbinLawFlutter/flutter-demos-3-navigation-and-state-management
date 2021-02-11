import 'package:get/get.dart';
import 'package:robbinlaw/models/user.dart';

class UserController extends GetxController {
  Rx<User> _userStream = Rx<User>();
  User get user => _userStream.value;
  set user(User value) => _userStream.value = value;

  updateUser(int count) {
    user.name = "Robbin";
    user.count = count;
  }
}
