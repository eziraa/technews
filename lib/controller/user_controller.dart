import 'package:get/get.dart';
import 'package:technews/model/user_model.dart';

class UserController extends GetxController {
  var _user = User(
    id: "1",
    name: "Anonymous",
    email: "exmaple@technews.com",
          phoneNumber: "89053656"
  ).obs;
  User get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.value = User(
      id: "1",
      name: "Anonymous",
      email: "exmaple@technews.com",
        phoneNumber: "89053656"
    );
  }

  void updateUser(User newUser) {
    _user.value = newUser;
  }

  void setCurrentUser(User newUser) {
    _user.value = newUser;
  }
}
