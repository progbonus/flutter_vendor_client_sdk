import 'package:example/pages/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('ProgBonus'),
      ),
      body: Center(
        child: Text('Client'),
      ),
    );
  }
}
