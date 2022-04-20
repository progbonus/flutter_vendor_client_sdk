import 'dart:developer';

import 'package:example/pages/pages.dart';
import 'package:example/services/services.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  LoginPageController({AuthService? auth}) : _auth = auth ?? Get.find();
  final AuthService _auth;

  final _email = ''.obs;
  final _password = ''.obs;

  @override
  Future onReady() async {
    super.onReady();
    if (_auth.isAuth) {
      Get.to(() => const HomePage());
    }
  }

  void onEmailChanged(String value) {
    _email(value);
    log(value);
  }

  void onPasswordChanged(String value) {
    _password(value);
    log(value);
  }

  Future login() async {
    if (_auth.isAuth) {
      Get.offAll(() => const HomePage());
      return;
    }

    final res = await _auth.loginWithUsernameAndPassword(
      email: _email.value,
      password: _password.value,
    );

    if (res.isFail) {
      return;
    }

    Get.offAll(const HomePage());
  }
}
