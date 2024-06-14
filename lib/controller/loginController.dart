import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  void login() async {
    isLoading(true);
    // Simulasikan proses login
    await Future.delayed(Duration(seconds: 2));
    isLoading(false);

    // Jika login berhasil, navigasi ke halaman berikutnya
    if (email.value == 'test@test.com' && password.value == 'password') {
      Get.snackbar('Success', 'Login Successful');
      // Navigasi ke halaman lain, misal home
      Get.offNamed('/home');
    } else {
      Get.snackbar('Error', 'Invalid Email or Password');
    }
  }
}
