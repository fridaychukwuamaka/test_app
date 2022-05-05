import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/controllers/auth_controller.dart';
import 'package:test_app/app/helpers/validator.dart';
import 'package:test_app/app/themes/themes.dart';
import 'package:test_app/app/views/pages/authentication/signup.dart';
import 'package:test_app/app/views/shared/shared.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/login_page';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppThemes.appPaddingVal * 1.5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  'Login',
                  style: AppTextStyle.headline6.copyWith(
                    color: AppColors.appBlack,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Welcome back',
                  style: AppTextStyle.bodyText2.copyWith(
                    color: AppColors.oldSilver,
                  ),
                ),
                const SizedBox(height: 60),
                PageInput(
                  hint: 'Enter your email',
                  label: 'Email or Phone Number',
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.emailValidation,
                  suffix: const Icon(IconlyLight.message),
                ),
                const SizedBox(
                  height: 42,
                ),
                PageInput(
                  hint: 'Enter your password',
                  label: 'Password',
                  controller: controller.password,
                  validator: Validator.passwordValidation,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 50,
                ),
                AppButton(
                  onPressed: () async => await controller.login(_formKey),
                  title: 'Login',
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  child: InkWell(
                    onTap: () => Get.toNamed(SignupPage.route),
                    child: Text.rich(
                      const TextSpan(
                        text: 'Dont have an account ',
                        children: [
                          TextSpan(
                              text: '? Sign Up',
                              style: TextStyle(
                                color: AppColors.amaranthRed,
                              )),
                        ],
                      ),
                      style: AppTextStyle.caption
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 13),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
