import 'package:get/get.dart';
import 'package:carbranding_apps/controller/loginController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
