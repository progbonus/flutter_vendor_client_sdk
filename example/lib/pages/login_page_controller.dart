import 'dart:developer';

import 'package:example/pages/pages.dart';
import 'package:example/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  LoginPageController({AuthService? auth}) : _auth = auth ?? Get.find();
  final AuthService _auth;

  final _email = ''.obs;
  final _password = ''.obs;

  final _phone = ''.obs;
  final _otp = ''.obs;
  final _verificationId = ''.obs;

  final _codeSend = false.obs;
  bool get codeSend => _codeSend.value;

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

  void onPhoneChanged(String value) {
    _phone(value);
    log(value);
  }

  void onOTPChanged(String value) {
    _otp(value);
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

  Future loginWithPhoneNumber() async {
    if (_auth.isAuth) {
      Get.offAll(() => const HomePage());
      return;
    }

    final res = await _auth.loginWithPhoneNumber(
      verificationId: _verificationId.value,
      otp: _otp.value,
    );

    if (res.isFail) {
      return;
    }

    Get.offAll(const HomePage());
  }

  Future verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phone.value,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException exception) {
        log(exception.toString());
      },
      codeSent: (String verificationId, int) {
        _verificationId(verificationId);
        _codeSend(true);
      },
      codeAutoRetrievalTimeout: (String) {},
    );
  }
}
