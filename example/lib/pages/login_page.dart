import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_up_get/speed_up_get.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import 'login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginPageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email'),
            TextField(
              onChanged: c.onEmailChanged,
            ),
            20.h,
            Text('Password'),
            TextField(
              onChanged: c.onPasswordChanged,
              obscureText: true,
            ),
            20.h,
            Center(
              child: ElevatedButton(
                onPressed: c.login,
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
