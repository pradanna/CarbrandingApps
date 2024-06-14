
import 'package:carbranding_apps/home.dart';
import 'package:carbranding_apps/login.dart';
import 'package:get/get.dart';

import 'controller/binding/loginBinding.dart';
import 'splashScreen.dart';

class RoutePage {

  List <GetPage>route = [
    GetPage(name: "/", page: () => SplashScreen()),
    GetPage(name: "/login", page: () => LoginView(), binding: LoginBinding()),
    GetPage(name: "/home", page: () => HomeView()),


  ];
}