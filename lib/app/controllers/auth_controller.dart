import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/data/repository/user_repository.dart';
import 'package:test_app/app/data/services/api_response.dart';
import 'package:test_app/app/views/pages/authentication/login.dart';

import '../views/pages/home/home.dart';
import '../views/shared/shared.dart';

class AuthController extends GetxController {
  final UserRepository _repo;
  AuthController(this._repo);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signUp(GlobalKey<FormState> form) async {
    if (form.currentState!.validate()) {
      ApiResponse response = await _repo.register(_payload);
      if (response.isSuccessful) {
        ApiResponse response = await _repo.login(_payload);
        if (response.isSuccessful) {
          Get.offNamed(HomePage.route);
          clearControllers();
          return;
        }
      }
      AppOverlay.showInfoDialog(
        title: 'Failure',
        content: response.message,
      );
    }
  }

  login(GlobalKey<FormState> form) async {
    if (form.currentState!.validate()) {
      ApiResponse response = await _repo.login(_payload);
      if (response.isSuccessful) {
        Get.offNamed(HomePage.route);
        clearControllers();
      } else {
        AppOverlay.showInfoDialog(
          title: 'Failure',
          content: response.message,
        );
      }
    }
  }

  Future<void> logout() async {
    await _repo.logout();

    Get.offNamed(LoginPage.route);
  }

  clearControllers() {
    email.clear();
    password.clear();
  }

  Map<String, dynamic> get _payload => {
        'email': email.text,
        'password': password.text,
      };
}

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        UserRepository(),
      ),
    );
  }
}
