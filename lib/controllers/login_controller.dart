import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  void login() {
    if (username.value.isNotEmpty && password.value.isNotEmpty) {
      if (username.value == 'Syifa Rahmadani' && password.value == 'uasmob') {
        Get.offNamed('/dashboard');
      } else {
        Get.snackbar('Error', 'Username / Password Salah');
      }
    } else {
      Get.snackbar('Error', 'Username dan Password harus diisi!');
    }
  }
}
