import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/binding/loginBinding.dart';
import 'login.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeView(),
        ),
      ],
    );
  }
}
