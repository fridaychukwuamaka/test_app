import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_app/app/controllers/auth_controller.dart';
import 'package:test_app/app/views/pages/authentication/login.dart';
import 'package:test_app/app/views/pages/authentication/signup.dart';
import 'package:test_app/app/views/pages/home/home.dart';

class AppPages {
  AppPages._();
  static String initial = FirebaseAuth.instance.currentUser == null
      ? LoginPage.route
      : HomePage.route;

  static final routes = [
    GetPage(
      name: LoginPage.route,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: SignupPage.route,
      page: () => const SignupPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: HomePage.route,
      page: () => const HomePage(),
      binding: AuthBinding(),
    ),
  ];
}
