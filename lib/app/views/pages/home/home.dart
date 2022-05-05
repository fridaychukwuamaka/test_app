import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/controllers/auth_controller.dart';
import 'package:test_app/app/themes/themes.dart';
import 'package:test_app/app/views/shared/shared.dart';

class HomePage extends GetView<AuthController> {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppThemes.appPaddingVal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the home page',
                style: AppTextStyle.headline5.copyWith(
                  color: AppColors.appBlack,
                ),
              ),
              const SizedBox(height: 40),
              AppButton(
                onPressed: () => controller.logout(),
                title: 'Logout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
